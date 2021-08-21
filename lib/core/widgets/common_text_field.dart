import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:reactive_forms/reactive_forms.dart';

class CommonTextField extends StatelessWidget {
  final Map<String, String> Function(FormControl<String>)? validationMessages;

  final String? controlName;

  final void Function()? onSubmitted;

  final String? placeHolderText;

  final TextInputAction? textInputAction;

  final String? prefixText;

  final bool isReadOnly;

  final bool isObscure;

  final Widget? suffix;

  final TextInputType? textInputType;

  final String? hintText;
  final TextInputFormatter? textInputFormatter;
  const CommonTextField(
      {this.validationMessages,
      this.controlName,
      this.onSubmitted,
      this.placeHolderText,
      this.textInputAction = TextInputAction.next,
      this.prefixText,
      this.isReadOnly = false,
      this.isObscure = false,
      this.suffix,
      this.hintText,
      this.textInputType,
      this.textInputFormatter});

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.yellow,
      child: ReactiveTextField<String>(
          formControlName: controlName,
          validationMessages: validationMessages,
          onSubmitted: onSubmitted,
          textInputAction: textInputAction,
          readOnly: isReadOnly,
          obscureText: isObscure,
          keyboardType: textInputType,
          inputFormatters: textInputType == TextInputType.number
              ? [FilteringTextInputFormatter.digitsOnly]
              : textInputFormatter == null
                  ? []
                  : [textInputFormatter!],
          style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black),
          decoration: InputDecoration(
            suffixIcon: suffix,
            contentPadding: const EdgeInsets.only(top: 25, bottom: 5),
            // suffixIconConstraints: BoxConstraints(),
            enabledBorder: UnderlineInputBorder(
                borderSide:
                    BorderSide(color: (Theme.of(context).primaryColor))),
            focusedBorder: isReadOnly
                ? UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: (Theme.of(context).primaryColor)))
                : null,
            labelText: placeHolderText,
            hintText: hintText,
            errorMaxLines: 3,
            prefixIconConstraints: BoxConstraints(
              minHeight: 0,
            ),
            prefixIcon: prefixText == null
                ? null
                : SizedBox(
                    width: 120,
                    child: Text(
                      prefixText!,
                      style: TextStyle(color: (Theme.of(context).primaryColor)),
                    ),
                  ),
          )),
    );
  }
}
