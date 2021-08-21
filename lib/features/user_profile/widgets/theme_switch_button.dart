import 'package:flutter/material.dart';

class ThemeSwitchButton extends StatefulWidget {
  final void Function(bool) onToggle;

  const ThemeSwitchButton(this.onToggle);

  @override
  _ThemeSwitchButtonState createState() => _ThemeSwitchButtonState();
}

class _ThemeSwitchButtonState extends State<ThemeSwitchButton> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Switch theme',
          style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 18),
        ),
        Spacer(),
        Switch(
            value: value,
            onChanged: (value) {
              setState(() {
                this.value = value;
              });
              widget.onToggle(value);
            }),
      ],
    );
  }
}
