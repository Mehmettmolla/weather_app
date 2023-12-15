import 'package:flutter/material.dart';
import 'package:weather_app/product/constant/app_color.dart';

class CustomCircleProgressIndicator extends StatelessWidget {
  const CustomCircleProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: AppColor.primaryBlue,
      ),
    );
  }
}
