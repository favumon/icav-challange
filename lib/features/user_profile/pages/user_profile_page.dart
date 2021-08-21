import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icav_challenge/core/utils/validation_helper.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../app_config/theme/theme.dart';
import '../../../core/widgets/button_normal.dart';
import '../../../core/widgets/common_text_field.dart';
import '../../../di/injection_container.dart';
import '../controllers/user_profile_page_controller.dart';
import '../widgets/profile_avatar.dart';
import '../widgets/theme_switch_button.dart';

class UserProfilePage extends StatelessWidget {
  final _controller = Get.put(getIt<UserProfilePageController>());
  UserProfilePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: TextStyle(
              fontWeight: FontWeight.w800,
              decoration: TextDecoration.none,
              fontSize: 22),
        ),
        actions: [
          IconButton(
              onPressed: _controller.onLogoutUser, icon: Icon(Icons.logout))
        ],
      ),
      body: Stack(
        children: [
          ReactiveFormBuilder(
              form: () => _controller.form,
              builder: (context, form, _) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 50,
                        ),
                        ProfileAvatar(),
                        SizedBox(
                          height: 50,
                        ),
                        CommonTextField(
                          controlName: 'name',
                          prefixText: 'Name',
                          validationMessages: (_) =>
                              generateValidationsMessages(
                                  'Name', _controller.nameValidation),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CommonTextField(
                          controlName: 'email',
                          prefixText: 'Email',
                          validationMessages: (_) =>
                              generateValidationsMessages(
                                  'email', _controller.emailValidation),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CommonTextField(
                          controlName: 'phoneNumber',
                          prefixText: 'Phone Number',
                          textInputFormatter: _controller.phoneNumberFormatter,
                          validationMessages: (_) =>
                              generateValidationsMessages('Phone Number'.tr,
                                  _controller.phoneNumberValidation,
                                  customPatternMessage:
                                      'Phone number shoud be +91 - ##########'),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CommonTextField(
                          controlName: 'username',
                          prefixText: 'Username',
                          isReadOnly: true,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ThemeSwitchButton((value) {
                          value
                              ? Get.changeTheme(theme2)
                              : Get.changeTheme(theme1);
                        })
                      ],
                    ),
                  ),
                );
              }),
          Align(
            alignment: Alignment.bottomCenter,
            child: ButtonNormal(
              isFullWidth: true,
              buttonText: 'Update',
              onTapped: _controller.onUpdateUseProfile,
            ),
          )
        ],
      ),
    );
  }
}
