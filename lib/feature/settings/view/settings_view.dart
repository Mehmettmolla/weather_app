import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:weather_app/product/constant/app_color.dart';
import 'package:weather_app/product/constant/app_padding.dart';
import 'package:weather_app/product/constant/app_radius.dart';
import 'package:weather_app/product/constant/app_size.dart';
import 'package:weather_app/product/widgets/app_bar/custom_app_bar.dart';

@RoutePage()
class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Settings',
      ),
      body:Column(
        children: [
          SizedBox(
            height: AppSize.screenHeight(context) * 0.12,
            child: ListView.builder(
              itemCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder:(context, index) {
              return Container(
                width: AppSize.screenWidth(context) * 0.4,
                padding: const EdgeInsets.all(AppPadding.defualtPadding),
                decoration: BoxDecoration(
                  borderRadius: AppRadius.radius12,
                  border: Border.all(color: AppColor.grey, width: 1),
                ),
                child: Column(
                  children: [
                    Text("Celsius"),
                  ],
                ),
              );
            },),
          )

        ],
      )
    );
  }
}