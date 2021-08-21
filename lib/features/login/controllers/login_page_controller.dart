import 'package:domain/features/login/usecases/autheticate_user.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../app_config/routes/app_routes.dart';
import '../../../core/services/alert_service.dart';
import '../../../core/services/navigation_service.dart';
import '../../../core/utils/validation_helper.dart';
import '../../../core/validation_params.dart';

@injectable
class LoginPageController extends GetxController {
  RxBool isObscureText = true.obs;

  final AuthenticateUser authenticateUser;

  LoginPageController(
      this.navigationService, this.alertService, this.authenticateUser) {
    initFormFields();
  }
  late final FormGroup form;

  Map<String, String> passwordValidationMessages() {
    return generateValidationsMessages(
        'Password', ValidationParams(isRequired: true));
  }

  Map<String, String> usernameValidationMessages() {
    return generateValidationsMessages(
        'Username', ValidationParams(isRequired: true));
  }

  void initFormFields() {
    form = fb.group({
      'user_name': FormControl<String>(
          validators:
              generateValidationsNonString(ValidationParams(isRequired: true))),
      'password': FormControl<String>(
          validators:
              generateValidationsNonString(ValidationParams(isRequired: true))),
    });
  }

  final NavigationService navigationService;
  final AlertService alertService;

  onLogin() async {
    final userName = (form.controls['user_name'] as FormControl<String>).value!;
    final password = (form.controls['password'] as FormControl<String>).value!;

    autheticate(userName, password);
  }

  void autheticate(String userName, String password) {
    authenticateUser(AutheticationRequestParams(userName, password))
        .then((value) {
      value.fold(
          (l) => alertService.showAlertSnackbar(
              title: 'Login failed', message: l.message ?? ''), (r) {
        navigationService.navigateAndReplace(AppRouts.profilePage);
      });
    });
  }

  void onSignup() {
    navigationService.navigateAndReplace(AppRouts.signupPage);
  }
}
