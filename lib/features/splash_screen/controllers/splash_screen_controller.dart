import 'package:domain/core/usecases/usecase.dart';
import 'package:domain/features/user_profile/usecases/get_user_info.dart';
import 'package:get/get.dart';
import 'package:icav_challenge/app_config/routes/app_routes.dart';
import 'package:injectable/injectable.dart';

import '../../../core/services/navigation_service.dart';

@injectable
class SplashScreenController extends GetxController {
  final NavigationService _navigationService;
  final GetUserInfo getUserInfo;
  SplashScreenController(this._navigationService, this.getUserInfo);

  @override
  void onReady() {
    super.onReady();
    navigate();
  }

  navigate() async {
    await Future.delayed(Duration(seconds: 2));
    getUserInfo(NoParams()).then((value) => value.fold((l) {
          _navigationService.navigateAndReplace(AppRouts.loginPage);
        }, (r) => _navigationService.navigateAndReplace(AppRouts.profilePage)));
  }
}
