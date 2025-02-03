import 'package:flutter/material.dart';

class Answerbutton extends StatelessWidget {
  const Answerbutton({super.key, required this.textLabel, required this.onTap});

  final String textLabel;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 40,
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(40))),
      onPressed: onTap,
      child: Text(textLabel),
    );
  }
}
