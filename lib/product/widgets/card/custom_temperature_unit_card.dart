import 'package:flutter/material.dart';
import 'package:weather_app/core/extension/widget/widget_extension.dart';
import 'package:weather_app/product/constant/app_color.dart';
import 'package:weather_app/product/constant/app_padding.dart';
import 'package:weather_app/product/constant/app_radius.dart';
import 'package:weather_app/product/constant/app_size.dart';
import 'package:weather_app/product/constant/app_text_style.dart';

class CustomTemperatureUnitCard extends StatelessWidget {
  const CustomTemperatureUnitCard(
      {super.key, this.title, this.isSelected, this.onTap});
  final String? title;
  final bool? isSelected;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: AppSize.screenWidth(context) * 0.43,
        padding: const EdgeInsets.all(AppPadding.defualtPadding),
        decoration: BoxDecoration(
          borderRadius: AppRadius.radius12,
          border: Border.all(
              color:
                  isSelected == false ? AppColor.black : AppColor.primaryBlue,
              width: isSelected == false ? 1 : 2),
        ),
        child: Center(
            child: Text(
          title!,
          style: isSelected == false
              ? AppTextStyle.blackSemibold16
              : AppTextStyle.primaryBlueSemibold16,
        )),
      ).paddingAll(AppPadding.betweenPadding),
    );
  }
}
