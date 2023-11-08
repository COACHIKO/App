import 'package:flutter/material.dart';

class CustomMaterialButton extends MaterialButton {
  final VoidCallback onPressed;
  final String buttonText;

  CustomMaterialButton({
    Key? key,
    required this.onPressed,
    required this.buttonText,
    Color highlightColor = Colors.blueAccent,
    Color splashColor = Colors.blueAccent,
    Duration animationDuration = const Duration(milliseconds: 100),
    double height = 120,
    double minWidth = 120,
  }) : super(
    key: key,
    onPressed: onPressed,
    child: Text(
      buttonText,
      style: TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold),
    ),
    height: height,
    minWidth: minWidth,
    color: Colors.white,
    shape: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(300))),
    highlightColor: highlightColor,
    splashColor: splashColor,
    animationDuration: animationDuration,
  );
}
