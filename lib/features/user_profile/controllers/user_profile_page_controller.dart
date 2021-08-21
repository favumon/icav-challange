import 'package:domain/core/entities/user.dart';
import 'package:domain/core/usecases/usecase.dart';
import 'package:domain/features/user_profile/usecases/get_user_info.dart';
import 'package:domain/features/user_profile/usecases/logout_user.dart';
import 'package:domain/features/user_profile/usecases/update_user_info.dart';
import 'package:get/get.dart';
import 'package:icav_challenge/core/utils/validation_helper.dart';
import 'package:icav_challenge/core/validation_params.dart';
import 'package:injectable/injectable.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../app_config/routes/app_routes.dart';
import '../../../core/services/alert_service.dart';
import '../../../core/services/navigation_service.dart';

@injectable
class UserProfilePageController extends GetxController {
  final GetUserInfo getUserInfo;
  final LogoutUser logoutUser;
  final NavigationService navigationService;
  final AlertService alertService;
  final UpdateUserInfo updateUserInfo;
  final nameValidation = ValidationParams(isRequired: true);
  final emailValidation = ValidationParams(isRequired: true, isEmail: true);
  final passwordValidation = ValidationParams(
      isRequired: true,
      pattern: '^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}\$');
  final usenameValidation = ValidationParams(isRequired: true);
  final phoneNumberValidation =
      ValidationParams(isRequired: true, pattern: r'^\+91 - [0-9]{10}$');
  var phoneNumberFormatter = new MaskTextInputFormatter(
      mask: '+91 - ##########', filter: {"#": RegExp(r'[0-9]')});
  User? _user;

  set user(User user) {
    _user = user;
    form.control('name').value = user.name;
    form.control('email').value = user.email;
    form.control('phoneNumber').value = user.phone;
    form.control('username').value = user.username;
  }

  void onInit() {
    super.onInit();
    fetchUserInfo();
  }

  final form = FormGroup({
    'name': FormControl<String>(
        validators:
            generateValidationsNonString(ValidationParams(isRequired: true))),
    'email': FormControl<String>(
        validators: generateValidationsNonString(
            ValidationParams(isRequired: true, isEmail: true))),
    'phoneNumber': FormControl<String>(
        validators: generateValidationsNonString(ValidationParams(
            isRequired: true, pattern: r'^\+91 - [0-9]{10}$'))),
    'username': FormControl<String>(),
  });
  UserProfilePageController(this.getUserInfo, this.logoutUser,
      this.navigationService, this.updateUserInfo, this.alertService);

  onLogoutUser() {
    logoutUser(NoParams()).then((value) => value.fold((l) => null,
        (r) => navigationService.navigateAndReplace(AppRouts.loginPage)));
  }

  void updateUser(bool isFormValid, String name, String email, String phone,
      String username, String password) {
    if (isFormValid)
      updateUserInfo(UpdateUserRequestParams(User(
              name: name,
              email: email,
              phone: phone,
              username: username,
              password: password)))
          .then((value) => value.fold((l) {
                alertService.showAlertSnackbar(
                    title: 'Failed', message: l.message ?? '');
              }, (r) {
                alertService.showSuccessSnackbar(
                    title: 'Success',
                    message: 'User profile has been updated sucessfully');
              }));
  }

  void onUpdateUseProfile() {
    form.unfocus();
    form.markAllAsTouched();

    final name = form.control('name').value;
    final email = form.control('email').value;
    final phone = form.control('phoneNumber').value;
    final username = form.control('username').value;

    updateUser(form.valid, name, email, phone, username, _user?.password ?? '');
  }

  void fetchUserInfo() {
    getUserInfo(NoParams())
        .then((value) => value.fold((l) => null, (r) => user = r));
  }
}
