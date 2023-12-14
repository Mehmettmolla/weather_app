import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/feature/settings/view_model/settings_view_model.dart';
import 'package:weather_app/product/router/app_router.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final appRouter = AppRouter();
  
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
          ChangeNotifierProvider(create: (_) => SettingsViewModel()),
      ],
      child: MaterialApp.router(
        title: 'Weather App',
        routerDelegate: appRouter.delegate(),
        routeInformationParser: appRouter.defaultRouteParser(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}