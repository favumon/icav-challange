import 'package:get/get.dart';

import '../../features/login/pages/login_page.dart';
import '../../features/signup/pages/signup_page.dart';
import '../../features/splash_screen/pages/splash_screen_page.dart';
import '../../features/user_profile/pages/user_profile_page.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRouts.initial,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: AppRouts.loginPage,
      page: () => LoginPage(),
    ),
    GetPage(
      name: AppRouts.signupPage,
      page: () => SignupPage(),
    ),
    GetPage(
      name: AppRouts.profilePage,
      page: () => UserProfilePage(),
    ),
  ];
}
