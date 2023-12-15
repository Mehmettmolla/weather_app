import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/core/extension/num/num_extension.dart';
import 'package:weather_app/core/extension/widget/widget_extension.dart';
import 'package:weather_app/feature/home/view_model/home_view_model.dart';
import 'package:weather_app/feature/settings/view_model/settings_view_model.dart';
import 'package:weather_app/product/constant/app_color.dart';
import 'package:weather_app/product/constant/app_padding.dart';
import 'package:weather_app/product/constant/app_radius.dart';
import 'package:weather_app/product/constant/app_size.dart';
import 'package:weather_app/product/constant/app_text_style.dart';
import 'package:weather_app/product/enum/weather_condition/weather_condition.dart';
import 'package:weather_app/product/utility/app_utility.dart';
import 'package:weather_app/product/widgets/app_bar/custom_app_bar.dart';
import 'package:weather_app/product/widgets/card/custom_daily_weather_card.dart';
import 'package:weather_app/product/widgets/card/custom_hourly_weather_card.dart';
import 'package:weather_app/product/widgets/indicator/custom_circle_progress_indicator.dart';

@RoutePage()
class HomeView extends StatefulWidget {
  const HomeView({super.key, this.lat, this.long});
  final double? lat;
  final double? long;
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HomeViewModel>().getWeather(widget.lat, widget.long);
      context
          .read<HomeViewModel>()
          .getPlaceMarkFromCoordinates(widget.lat, widget.long!);
    });
  }

  @override
  Widget build(BuildContext context) {
    final homeProvider = context.watch<HomeViewModel>();
    final settingsProvider = context.watch<SettingsViewModel>();
    return Scaffold(
      appBar: _appBar(settingsProvider, homeProvider),
      body: homeProvider.weatherModel == null || homeProvider.location == null
          ? const CustomCircleProgressIndicator()
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _currentLocationCart(context, homeProvider, settingsProvider),
                _forecastList(context, homeProvider),
              ],
            ),
    );
  }

  Expanded _forecastList(BuildContext context, HomeViewModel homeProvider) {
    return Expanded(
      child: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppPadding.defualtPadding.height,
          Text(
            "Daily Forecast",
            style: AppTextStyle.primaryBlueSemibold16,
          ).paddingSymetric(horizontal: AppPadding.horizontalPadding),
          AppPadding.spacingPadding.height,
          _dailyList(context, homeProvider),
          AppPadding.defualtPadding.height,
          Text(
            "Hourly Forecast",
            style: AppTextStyle.primaryBlueSemibold16,
          ).paddingSymetric(horizontal: AppPadding.horizontalPadding),
          AppPadding.spacingPadding.height,
          _hourlyList(context, homeProvider)
              .paddingSymetric(horizontal: AppPadding.horizontalPadding),
          SizedBox(
            height: AppSize.screenHeight(context) * 0.2,
          )
        ],
      )),
    );
  }

  Container _hourlyList(BuildContext context, HomeViewModel homeProvider) {
    return Container(
      height: AppSize.screenHeight(context) * 0.13,
      width: AppSize.screenWidth(context),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
        color: AppColor.white,
        borderRadius: AppRadius.radius16,
      ),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: homeProvider.weatherModel!.hourly!.time?.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final time = homeProvider.weatherModel!.hourly!.time![index];
          final weatherCode =
              homeProvider.weatherModel!.hourly!.weatherCode![index];
          final weatherDegree =
              homeProvider.weatherModel!.hourly!.temperature_2m![index];
          return CustomHourlyWeatherCard(
            hour: time,
            lottieAsset:
                WeatherConditionExtension.fromCode(weatherCode!).lottieAsset,
            weatherDegree: weatherDegree,
          );
        },
      ),
    );
  }

  SizedBox _dailyList(BuildContext context, HomeViewModel homeProvider) {
    return SizedBox(
      height: AppSize.screenHeight(context) * 0.18,
      width: AppSize.screenWidth(context),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: homeProvider.weatherModel!.daily!.time?.length,
        padding: const EdgeInsets.symmetric(
            horizontal: AppPadding.horizontalPadding),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final time = homeProvider.weatherModel!.daily!.time![index];
          final weatherCode =
              homeProvider.weatherModel!.daily!.weatherCode![index];
          return CustomDailyWeatherCard(
            day: time,
            lottieAsset:
                WeatherConditionExtension.fromCode(weatherCode!).lottieAsset,
            weatherStatus: WeatherConditionExtension.fromCode(weatherCode),
          );
        },
      ),
    );
  }

  Container _currentLocationCart(BuildContext context,
      HomeViewModel homeProvider, SettingsViewModel settingsProvider) {
    return Container(
      height: AppSize.screenHeight(context) * 0.23,
      width: AppSize.screenWidth(context),
      padding:
          const EdgeInsets.symmetric(horizontal: AppPadding.horizontalPadding),
      decoration: BoxDecoration(
        color: AppColor.primaryBlue,
        borderRadius: AppRadius.bottomRadius20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    formatTemperature(
                            homeProvider.weatherModel!.current!.temperature_2m!,
                            settingsProvider.temp!)
                        .toString(),
                    style: AppTextStyle.whiteSemibold44,
                  ),
                  AppPadding.betweenPadding.height,
                  Text(
                    WeatherConditionExtension.fromCode(
                            homeProvider.weatherModel!.current!.weatherCode!)
                        .toString(),
                    style: AppTextStyle.whiteSemibold32,
                  ),
                ],
              ),
              const Spacer(),
              Lottie.asset(
                WeatherConditionExtension.fromCode(
                        homeProvider.weatherModel!.current!.weatherCode!)
                    .lottieAsset,
                height: AppSize.screenHeight(context) * 0.2,
              ),
            ],
          ),
        ],
      ),
    );
  }

  CustomAppBar _appBar(
      SettingsViewModel settingsProvider, HomeViewModel homeProvider) {
    return CustomAppBar(
        title:
            settingsProvider.selectedProvince?.name ?? homeProvider.location);
  }
}
