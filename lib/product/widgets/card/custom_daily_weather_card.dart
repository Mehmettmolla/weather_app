import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/core/extension/widget/widget_extension.dart';
import 'package:weather_app/product/constant/app_padding.dart';
import 'package:weather_app/product/constant/app_radius.dart';
import 'package:weather_app/product/constant/app_text_style.dart';
import 'package:weather_app/product/utility/app_utility.dart';

class CustomDailyWeatherCard extends StatelessWidget {
  const CustomDailyWeatherCard({super.key, this.day, this.lottieAsset, this.weatherStatus});
  final String? day;
  final String? lottieAsset;
  final String? weatherStatus;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppPadding.horizontalPadding,
        vertical: AppPadding.verticalPadding,
      ),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
        color: Colors.white,
        borderRadius: AppRadius.radius16,
      ),
      child: Column(
        children: [
          Text(getDayString(day!), style: AppTextStyle.greySemibold16,),
          Lottie.asset(lottieAsset!, height: 70,),
          const Spacer(),
          Text(weatherStatus!, style: AppTextStyle.blackSemibold16,),
        ],
      ),

    ).paddingAll(
      AppPadding.betweenPadding, 
    );
  }


}