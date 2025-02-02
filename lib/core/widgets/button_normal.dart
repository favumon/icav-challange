import 'package:flutter/material.dart';

class ButtonNormal extends StatelessWidget {
  final String? buttonText;

  final void Function()? onTapped;

  final bool isFullWidth;

  const ButtonNormal(
      {this.buttonText, this.onTapped, this.isFullWidth = false});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: isFullWidth ? double.infinity : null,
        height: 50,
        child: ElevatedButton(
            onPressed: onTapped,
            style: ElevatedButton.styleFrom(
                primary: Theme.of(context).primaryColor),
            child: Text(
              buttonText ?? '',
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(color: Colors.white),
            )));
  }
}
