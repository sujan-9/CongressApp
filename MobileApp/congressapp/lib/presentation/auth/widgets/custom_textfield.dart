import 'package:congressapp/app/core/constants/pallets.dart';
import 'package:congressapp/app/core/constants/sizes.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.controller,
    // required this.isVisible,
    required this.hintText,
    this.prefixIcon,
    this.label,
    this.readOnly,
    this.focus,
  });
  final TextEditingController? controller;
  // final bool isVisible;
  final String hintText;
  final Widget? prefixIcon;
  final Text? label;
  final bool? readOnly;
  final bool? focus;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 2,
              offset: const Offset(0, 2), // changes the position of the shadow
            ),
          ]),
      child: TextField(
        controller: controller,
        readOnly: readOnly ?? false,
        style: const TextStyle(
            fontSize: Sizes.p16,
            color: Colors.black,
            fontWeight: FontWeight.bold),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(
              fontSize: Sizes.p16,
              color: Colors.black,
              fontWeight: FontWeight.w400),
          label: label ?? const SizedBox.shrink(),
          enabled: focus ?? true,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelStyle: const TextStyle(
            color: redColor,
            fontSize: Sizes.p18,
          ),
          prefixIcon: prefixIcon,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color.fromARGB(255, 0, 0, 3),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color.fromARGB(217, 29, 170, 55),
              width: 2,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color.fromARGB(204, 39, 152, 17),
              width: 2,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color.fromARGB(255, 0, 0, 3),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color.fromARGB(204, 200, 30, 30),
              width: 2,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color.fromARGB(204, 200, 30, 30),
              width: 2,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          contentPadding: const EdgeInsetsDirectional.fromSTEB(16, 24, 0, 24),
        ),
      ),
    );
  }
}
