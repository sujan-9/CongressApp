import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final TextStyle textStyle;

  // Private constructor
  const CustomText._({
    required this.text,
    required this.textStyle,
  });

  // Factory constructor for large text
  factory CustomText.large(String text, {Color? color}) {
    return CustomText._(
      text: text,
      textStyle: TextStyle(
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
        color: color ?? Colors.black,
      ),
    );
  }

  // Factory constructor for medium text
  factory CustomText.medium(String text, {Color? color}) {
    return CustomText._(
      text: text,
      textStyle: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.w400,
        color: color ?? Colors.black,
      ),
    );
  }

  // Factory constructor for small text
  factory CustomText.small(String text, {Color? color}) {
    return CustomText._(
      text: text,
      textStyle: TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.normal,
        color: color ?? Colors.black,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: textStyle,
    );
  }
}
