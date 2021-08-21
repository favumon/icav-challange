import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/utils/validation_helper.dart';
import '../../../core/widgets/button_normal.dart';
import '../../../core/widgets/common_text_field.dart';
import '../../../di/injection_container.dart';
import 'package:reactive_forms/reactive_forms.dart';
import '../controllers/signup_page_controller.dart';

class SignupPage extends StatelessWidget {
  final SignupPageController _controller = Get.put(getIt());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ReactiveFormBuilder(
              form: () => _controller.signupForm,
              builder: (context, _, __) {
                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SizedBox(
                          height: 60,
                        ),
                        Text(
                          'Register',
                          style:
                              Theme.of(context).textTheme.headline5!.copyWith(
                                    color: Colors.black,
                                    fontSize: 30,
                                  ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        CommonTextField(
                          controlName: 'name',
                          placeHolderText: 'Name',
                          validationMessages: (_) =>
                              generateValidationsMessages(
                                  'Name', _controller.nameValidation),
                        ),
                        CommonTextField(
                          controlName: 'email',
                          placeHolderText: 'Email',
                          validationMessages: (_) =>
                              generateValidationsMessages(
                                  'email', _controller.emailValidation),
                        ),
                        CommonTextField(
                          controlName: 'phoneNumber',
                          placeHolderText: 'Phone Number',
                          textInputFormatter: _controller.phoneNumberFormatter,
                          validationMessages: (_) =>
                              generateValidationsMessages('Phone Number'.tr,
                                  _controller.phoneNumberValidation,
                                  customPatternMessage:
                                      'Phone number shoud be +91 - ##########'),
                        ),
                        CommonTextField(
                          controlName: 'username',
                          placeHolderText: 'User Name'.tr,
                          validationMessages: (_) =>
                              generateValidationsMessages(
                                  'Userame', _controller.usenameValidation),
                        ),
                        CommonTextField(
                          controlName: 'password',
                          placeHolderText: 'Password',
                          validationMessages: (_) => generateValidationsMessages(
                              'Password', _controller.passwordValidation,
                              customPatternMessage:
                                  'Password should minumum lengh of 8 and contain 1 uppercase 1 lowecase 1 number and special characters ! @ # \$ & * ~ '),
                        ),
                        CommonTextField(
                          controlName: 'confirmPassword',
                          placeHolderText: 'Confirm Password',
                          validationMessages: (_) =>
                              generateValidationsMessages('Confirm password',
                                  _controller.passwordValidation,
                                  matchingFieldName: 'password'),
                        ),
                      ],
                    ),
                  ),
                );
              }),
          Align(
            alignment: Alignment.bottomCenter,
            child: ButtonNormal(
              isFullWidth: true,
              buttonText: 'Register',
              onTapped: _controller.onRegister,
            ),
          )
        ],
      ),
    );
  }
}
