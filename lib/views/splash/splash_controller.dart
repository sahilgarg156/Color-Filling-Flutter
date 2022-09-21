import 'package:color_app/views/home/home_screen.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    callNextScreen();
  }

  void callNextScreen() {
    Future.delayed(const Duration(seconds: 1), () => Get.offAllNamed(HomeScreen.routeName));
  }
}