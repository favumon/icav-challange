import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app_config/routes/app_pages.dart';
import 'app_config/routes/app_routes.dart';
import 'app_config/theme/theme.dart';
import 'di/injection_container.dart';
import 'features/splash_screen/pages/splash_screen_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme1,
      home: SplashScreen(),
      initialRoute: AppRouts.initial,
      getPages: AppPages.pages,
    );
  }
}
