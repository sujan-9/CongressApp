import 'package:congressapp/app/core/constants/sizes.dart';
import 'package:congressapp/app/utils/app_strings.dart';
import 'package:flutter/material.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          //to be implemented
        },
        child: const Text(AppStrings.forgetPassword,
            style: TextStyle(color: Colors.black54, fontSize: Sizes.p16)));
  }
}
