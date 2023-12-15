import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/core/service/local/local_service.dart';
import 'package:weather_app/feature/home/view_model/home_view_model.dart';
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
      determinePosition().then((value) => {
        context.router.replace(BaseScaffoldRoute(
          lat: value.latitude,
          lon: value.longitude,
        ))
      });

    });
  }
  Future<Position> determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return Future.error("Location services are disabled.");
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('Location permissions are denied');
    }
  }
  
  if (permission == LocationPermission.deniedForever) {
    return Future.error(
      'Location permissions are permanently denied, we cannot request permissions.');
  } 

  return await Geolocator.getCurrentPosition();
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
