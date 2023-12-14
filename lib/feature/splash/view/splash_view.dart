import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/gen/assets.gen.dart';
import 'package:weather_app/product/constant/app_size.dart';
import 'package:weather_app/product/router/app_router.gr.dart';

@RoutePage()
class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      context.router.replace(const BaseScaffoldRoute());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Lottie.asset(
        Assets.lottie.splashLottie,
        fit: BoxFit.cover,
        width: AppSize.screenWidth(context) * 0.7,
      )),
    );
  }
}
