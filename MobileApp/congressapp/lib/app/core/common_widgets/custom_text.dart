import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final TextStyle textStyle;

  // Private constructor
  const CustomText._({required this.text, required this.textStyle});

  // Factory constructor for large text
  factory CustomText.large(String text) {
    return CustomText._(
      text: text,
      textStyle: const TextStyle(
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    );
  }

  // Factory constructor for medium text
  factory CustomText.medium(String text) {
    return CustomText._(
      text: text,
      textStyle: const TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.w400,
        color: Colors.black,
      ),
    );
  }

  // Factory constructor for small text
  factory CustomText.small(String text) {
    return CustomText._(
      text: text,
      textStyle: const TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.normal,
        color: Colors.black,
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
