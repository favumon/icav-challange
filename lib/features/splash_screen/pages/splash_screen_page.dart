import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../di/injection_container.dart';
import '../controllers/splash_screen_controller.dart';

class SplashScreen extends StatelessWidget {
  final SplashScreenController splashScreenController = Get.put(getIt());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FlutterLogo(
            size: 90,
          ),
          Text(
            'Splashscreen',
            style: TextStyle(fontSize: 20),
          )
        ],
      ),
    ));
  }
}
