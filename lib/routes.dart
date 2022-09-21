import 'package:get/get.dart';

import 'views/home/home_binding.dart';
import 'views/home/home_screen.dart';
import 'views/splash/splash_binding.dart';
import 'views/splash/splash_screen.dart';

routes() => [
      GetPage(
          name: SplashScreen.routeName,
          binding: SplashBinding(),
          page: () => SplashScreen()),
      GetPage(
          name: HomeScreen.routeName,
          binding: HomeBinding(),
          page: () => HomeScreen()),
    ];
