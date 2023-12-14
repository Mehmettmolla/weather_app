import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/core/extension/num/num_extension.dart';
import 'package:weather_app/core/extension/widget/widget_extension.dart';
import 'package:weather_app/gen/assets.gen.dart';
import 'package:weather_app/product/constant/app_color.dart';
import 'package:weather_app/product/constant/app_padding.dart';
import 'package:weather_app/product/constant/app_radius.dart';
import 'package:weather_app/product/constant/app_size.dart';
import 'package:weather_app/product/constant/app_text_style.dart';
import 'package:weather_app/product/widgets/app_bar/custom_app_bar.dart';
import 'package:weather_app/product/widgets/card/custom_daily_weather_card.dart';
import 'package:weather_app/product/widgets/card/custom_hourly_weather_card.dart';

@RoutePage()
class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'İstanbul',
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: AppSize.screenHeight(context) * 0.3,
            width: AppSize.screenWidth(context),
            padding: const EdgeInsets.symmetric(
              horizontal: AppPadding.horizontalPadding
            ),
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
                        Text("18 C", style: AppTextStyle.whiteSemibold44,),
                        Text("Snowing", style: AppTextStyle.whiteSemibold32,),
                      ],
                    ),
                    const Spacer(),
                    Lottie.asset(Assets.lottie.snowyLottie, height: AppSize.screenHeight(context) * 0.2,),
                  ],
                ),
              ],
            ),
          ),

          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppPadding.defualtPadding.height,
                  Text("Daily Forecast", style: AppTextStyle.primaryBlueSemibold16,).paddingSymetric(
                horizontal: AppPadding.horizontalPadding
              ),
                  AppPadding.spacingPadding.height,
                  SizedBox(
                    height: AppSize.screenHeight(context) * 0.18,
                    width: AppSize.screenWidth(context),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 5,
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppPadding.horizontalPadding
                      ),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return CustomDailyWeatherCard(
                          day: "Today",
                          lottieAsset: Assets.lottie.snowyLottie,
                          weatherStatus: "Snowing",
                        );
                      },
                    ),
                  ),
                  AppPadding.defualtPadding.height,
                  Text("Hourly Forecast", style: AppTextStyle.primaryBlueSemibold16,).paddingSymetric(
                horizontal: AppPadding.horizontalPadding
              ),
                  AppPadding.spacingPadding.height,
                  Container(
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
                      itemCount: 5,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return CustomHourlyWeatherCard(
                          hour: "12:00",
                          lottieAsset: Assets.lottie.snowyLottie,
                          weatherDegree: "18 C",
                        );
                      },
                    ),
                  ).paddingSymetric(
                horizontal: AppPadding.horizontalPadding
                  ),
                  SizedBox(
                    height: AppSize.screenHeight(context) * 0.2,
                  )
                ],
              )
            ),
          ),
        ],
      ),
    );
  }
}