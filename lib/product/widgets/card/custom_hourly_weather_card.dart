import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/core/extension/num/num_extension.dart';
import 'package:weather_app/core/service/local/local_service.dart';
import 'package:weather_app/product/constant/app_padding.dart';
import 'package:weather_app/product/constant/app_text_style.dart';
import 'package:weather_app/product/utility/app_utility.dart';


class CustomHourlyWeatherCard extends StatelessWidget {
  const CustomHourlyWeatherCard({super.key, this.hour, this.lottieAsset, this.weatherDegree});
  final String? hour;
  final String? lottieAsset;
  final double? weatherDegree;
  @override
  Widget build(BuildContext context) {
    
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppPadding.horizontalPadding,
        vertical: AppPadding.verticalPadding,
      ),
      child: Column(
        children: [
          Text(extractTime(hour!), style: AppTextStyle.blackSemibold12),
         AppPadding.betweenPadding.height,
         Lottie.asset(lottieAsset!, height: 40,),
          AppPadding.betweenPadding.height,
          Text(formatTemperature(weatherDegree!, LocalService.getTemp() == "true" ? true : false), style: AppTextStyle.blackSemibold12),
        ],
      ),
    );
  }




}