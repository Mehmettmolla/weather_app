import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/product/constant/app_color.dart';
import 'package:weather_app/product/constant/app_text_style.dart';
import 'package:weather_app/product/router/app_router.gr.dart';

@RoutePage()
class BaseScaffoldView extends StatefulWidget {
  const BaseScaffoldView({super.key, this.lat, this.lon});
  final double? lat;
  final double? lon;
  @override
  State<BaseScaffoldView> createState() => _BaseScaffoldViewState();
}

class _BaseScaffoldViewState extends State<BaseScaffoldView> {
  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter.tabBar(
      physics: const NeverScrollableScrollPhysics(),
      animatePageTransition: false,
      routes:  [HomeRoute(
          lat: widget.lat,
          long: widget.lon,
      ), const SettingsRoute()],
      builder: (context, child, tabController) {
        return Scaffold(
          resizeToAvoidBottomInset: true,
          extendBody: true,
          body: child,
          bottomNavigationBar: bottomNavigationBar(tabController, context),
        );
      },
    );
  }

  BottomNavigationBar bottomNavigationBar(
      TabController tabController, BuildContext context) {
    return BottomNavigationBar(
        selectedLabelStyle: AppTextStyle.primaryBlueSemibold16,
        unselectedLabelStyle: AppTextStyle.blackSemibold16,
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColor.white,
        selectedItemColor: AppColor.primaryBlue,
        unselectedItemColor: AppColor.black,
        currentIndex: tabController.index,
        onTap: (index) => context.tabsRouter.setActiveIndex(index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ]);
  }
}
