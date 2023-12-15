import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/core/extension/num/num_extension.dart';
import 'package:weather_app/core/extension/widget/widget_extension.dart';
import 'package:weather_app/feature/settings/view_model/settings_view_model.dart';
import 'package:weather_app/product/constant/app_padding.dart';
import 'package:weather_app/product/constant/app_text_style.dart';
import 'package:weather_app/product/widgets/app_bar/custom_app_bar.dart';
import 'package:weather_app/product/widgets/button/custom_button.dart';
import 'package:weather_app/product/widgets/card/custom_temperature_unit_card.dart';
import 'package:weather_app/product/widgets/dropdown/custom_dropdown_button.dart';

@RoutePage()
class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  String? selectedCity;
  List<String> cities = ['Ankara', 'İstanbul', 'İzmir', 'Antalya', 'Bursa'];
  @override
  Widget build(BuildContext context) {
    final settingsProvider = Provider.of<SettingsViewModel>(context);
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Settings',
      ),
      body:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppPadding.verticalPadding.height,
          Text("Temperature Unit", style: AppTextStyle.primaryBlueSemibold16,),
          AppPadding.verticalPadding.height,
          Center(
            child: Wrap(
              alignment: WrapAlignment.center,
              children: 
                  settingsProvider.temperatureUnitList.map((e) => CustomTemperatureUnitCard(
                    onTap: () {
                      settingsProvider.changeTemperatureUnit(e);
                      settingsProvider.saveTemperatureUnit(e);
                    },
                    isSelected: e.isSelected,
                    title: e.unit,
                  )).toList(),
            ),
          ),
          AppPadding.verticalPadding.height,
          Text("Select Location", style: AppTextStyle.primaryBlueSemibold16,),
          AppPadding.verticalPadding.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomDropdownButton(
                selected: selectedCity,
                list: cities,
                title: 'Select City',
              ),
              const Spacer(),
                CustomDropdownButton(
                selected: selectedCity,
                list: cities,
                title: 'Select District',
              ),
            ],
          ),
          AppPadding.verticalPadding.height,
          CustomButton(
            onTap: () {},
            title: 'Save',
          )
        ],
      ).paddingSymetric(
        horizontal: AppPadding.horizontalPadding,
      )
    );
  }
}