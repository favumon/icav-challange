import 'package:domain/core/entities/user.dart';
import 'package:domain/core/error/failures.dart';
import 'package:domain/features/signup/usecases/submit_signup_info.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../app_config/routes/app_routes.dart';
import '../../../core/services/alert_service.dart';
import '../../../core/services/navigation_service.dart';
import '../../../core/utils/validation_helper.dart';
import '../../../core/validation_params.dart';

@injectable
class SignupPageController extends GetxController {
  final NavigationService _navigationService;
  final AlertService _dialogService;
  bool isTermsAccepted = false;
  final SubmitSignupInfo submitSignupInfo;
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

  late FormGroup signupForm;
  SignupPageController(
      this._navigationService, this._dialogService, this.submitSignupInfo) {
    initFormFields();
  }

  void initFormFields() {
    signupForm = fb.group({
      'name': FormControl<String>(
          validators: generateValidationsNonString(nameValidation)),
      'email': FormControl<String>(
          validators: generateValidationsNonString(emailValidation)),
      'phoneNumber': FormControl<String>(
          validators: generateValidationsNonString(phoneNumberValidation)),
      'username': FormControl<String>(
          validators: generateValidationsNonString(usenameValidation)),
      'password': FormControl<String>(
          validators: generateValidationsNonString(passwordValidation)),
      'confirmPassword': FormControl<String>(),
    }, [
      _mustMatch('password', 'confirmPassword')
    ]);
  }

  void registerUser(bool isFormValid, String name, String email,
      String phoneNumber, String username, String password) {
    if (!isFormValid) return;
    submitSignupInfo(SignupRequestParams(User(
            email: email,
            name: name,
            password: password,
            phone: phoneNumber,
            username: username)))
        .then((value) => value.fold((l) {
              if (l is SignupFailure) {
                _dialogService.showAlertSnackbar(
                    title: 'Error', message: l.message ?? '');
              }
            },
                (r) =>
                    _navigationService.navigateAndReplace(AppRouts.loginPage)));
  }

  void onRegister() {
    signupForm..markAllAsTouched();

    final name = getFormValue<String>('name');
    final email = getFormValue<String>('email');
    final phoneNumber = getFormValue<String>('phoneNumber');
    final username = getFormValue<String>('username');
    final password = getFormValue<String>('password');

    registerUser(
        signupForm.valid, name, email, phoneNumber, username, password);
  }

  T getFormValue<T>(String controlName) {
    return (signupForm.controls[controlName] as FormControl<T>).value!;
  }

  ValidatorFunction _mustMatch(String controlName, String matchingControlName) {
    return (AbstractControl<dynamic> control) {
      final form = control as FormGroup;

      final formControl = form.control(controlName);
      final matchingFormControl = form.control(matchingControlName);

      if (formControl.value != matchingFormControl.value) {
        matchingFormControl.setErrors({'mustMatch': true});

        // force messages to show up as soon as possible
        matchingFormControl.markAsTouched();
      } else {
        matchingFormControl.removeError('mustMatch');
      }

      return null;
    };
  }
}
