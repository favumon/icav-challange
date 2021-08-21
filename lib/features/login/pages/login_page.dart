import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../core/widgets/button_normal.dart';
import '../../../core/widgets/common_text_field.dart';
import '../../../di/injection_container.dart';
import '../controllers/login_page_controller.dart';

class LoginPage extends StatelessWidget {
  final LoginPageController _loginPageController =
      Get.put<LoginPageController>(getIt());

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Login',
            style: TextStyle(
                fontWeight: FontWeight.w800,
                decoration: TextDecoration.none,
                fontSize: 22),
          ),
        ),
        body: ReactiveFormBuilder(
            form: () => _loginPageController.form,
            builder: (context, form, child) {
              return Stack(children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CommonTextField(
                        controlName: 'user_name',
                        validationMessages: (_) =>
                            _loginPageController.usernameValidationMessages(),
                        onSubmitted: () => form.focus('password'),
                        placeHolderText: 'User name' + '*',
                      ),
                      Obx(() => CommonTextField(
                            controlName: 'password',
                            isObscure: _loginPageController.isObscureText.value,
                            validationMessages: (_) => _loginPageController
                                .passwordValidationMessages(),
                            placeHolderText: 'Password' + '*',
                            textInputAction: TextInputAction.done,
                            suffix: InkWell(
                              onTap: () =>
                                  _loginPageController.isObscureText.value =
                                      !_loginPageController.isObscureText.value,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Text(
                                  _loginPageController.isObscureText.value
                                      ? 'show'
                                      : 'hide',
                                  style: TextStyle(color: Color(0xFF0091FF)),
                                ),
                              ),
                            ),
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      TextButton(
                          onPressed: _loginPageController.onSignup,
                          child: Text(
                            'New user? Signup',
                            style: TextStyle(color: Colors.blue),
                          ))
                    ],
                  ),
                ),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: ReactiveFormConsumer(
                      builder: (context, form, child) {
                        return ButtonNormal(
                          isFullWidth: true,
                          buttonText: 'Login',
                          onTapped:
                              form.valid ? _loginPageController.onLogin : null,
                        );
                      },
                    ))
              ]);
            }));
  }
}
