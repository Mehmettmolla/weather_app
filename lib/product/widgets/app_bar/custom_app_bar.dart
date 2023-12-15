import 'package:flutter/material.dart';
import 'package:weather_app/product/constant/app_color.dart';
import 'package:weather_app/product/constant/app_text_style.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  @override
  final Size preferredSize;
  const CustomAppBar({super.key, this.title})
      : preferredSize = const Size.fromHeight(50.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Align(
        alignment: Alignment.centerLeft,
        child: Text(title ?? '', style: AppTextStyle.whiteSemibold32),
      ),
      backgroundColor: AppColor.primaryBlue,
      actions: [
        IconButton(
          icon: const Icon(Icons.notifications_none_outlined),
          onPressed: () {},
          alignment: Alignment.centerRight,
        ),
        IconButton(
          icon: const Icon(Icons.more_horiz),
          onPressed: () {},
          alignment: Alignment.centerRight,
        ),
      ],
      elevation: 0.0,
    );
  }
}
