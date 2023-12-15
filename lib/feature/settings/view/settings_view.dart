import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/core/extension/num/num_extension.dart';
import 'package:weather_app/core/extension/widget/widget_extension.dart';
import 'package:weather_app/feature/home/view_model/home_view_model.dart';
import 'package:weather_app/feature/settings/view_model/settings_view_model.dart';
import 'package:weather_app/product/constant/app_padding.dart';
import 'package:weather_app/product/constant/app_text_style.dart';
import 'package:weather_app/product/widgets/app_bar/custom_app_bar.dart';
import 'package:weather_app/product/widgets/card/custom_temperature_unit_card.dart';
import 'package:weather_app/product/widgets/dropdown/custom_dropdown_button.dart';
import 'package:weather_app/product/widgets/indicator/custom_circle_progress_indicator.dart';

@RoutePage()
class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<SettingsViewModel>().getProvinceList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final settingsProvider = Provider.of<SettingsViewModel>(context);
    final homeProvider = Provider.of<HomeViewModel>(context);
    return Scaffold(
        appBar: _appBar(),
        body: settingsProvider.provinceModel == null
            ? const CustomCircleProgressIndicator()
            : _body(settingsProvider, homeProvider).paddingSymetric(
                horizontal: AppPadding.horizontalPadding,
              ));
  }

  Column _body(SettingsViewModel settingsProvider, HomeViewModel homeProvider) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppPadding.verticalPadding.height,
        Text(
          "Temperature Unit",
          style: AppTextStyle.primaryBlueSemibold16,
        ),
        AppPadding.verticalPadding.height,
        _temperatureUnit(settingsProvider),
        AppPadding.verticalPadding.height,
        Text(
          "Select Location",
          style: AppTextStyle.primaryBlueSemibold16,
        ),
        AppPadding.verticalPadding.height,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _selectLocation(settingsProvider, homeProvider),
          ],
        ),
      ],
    );
  }

  CustomDropdownButton _selectLocation(
      SettingsViewModel settingsProvider, HomeViewModel homeProvider) {
    return CustomDropdownButton(
      selected: settingsProvider.selectedProvince,
      list: settingsProvider.provinceModel!.data!.map((e) => e!.name!).toList(),
      title: 'Select City',
      onChanged: (v0) {
        settingsProvider.selectCityLocation(v0!.name);
        homeProvider.getWeather(
            settingsProvider.selectedLat, settingsProvider.selectedLong!);
      },
    );
  }

  Center _temperatureUnit(SettingsViewModel settingsProvider) {
    return Center(
      child: Wrap(
        alignment: WrapAlignment.center,
        children: settingsProvider.temperatureUnitList
            .map((e) => CustomTemperatureUnitCard(
                  onTap: () {
                    settingsProvider.changeTemperatureUnit(e);
                    settingsProvider.saveTemperatureUnit(e);
                  },
                  isSelected: e.isSelected,
                  title: e.unit,
                ))
            .toList(),
      ),
    );
  }

  CustomAppBar _appBar() {
    return const CustomAppBar(
      title: 'Settings',
    );
  }
}
