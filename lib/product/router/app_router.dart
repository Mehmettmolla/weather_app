import 'package:auto_route/auto_route.dart';
import 'package:weather_app/product/router/app_router.gr.dart';
              
@AutoRouterConfig(replaceInRouteName: 'View,Route')
class AppRouter extends $AppRouter {      
    
  @override
  List<AutoRoute> get routes => [      
    AutoRoute(page: HomeRoute.page, initial: true),
   ];
 }