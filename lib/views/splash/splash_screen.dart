import 'package:color_app/util/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'splash_controller.dart';

class SplashScreen extends StatelessWidget {
  static final routeName = '/SplashScreen';
  final splashController = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomColors.colorWhite,
    );
  }
}
