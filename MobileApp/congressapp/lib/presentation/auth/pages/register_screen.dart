import 'package:congressapp/app/core/common_widgets/custom_appbar.dart';
import 'package:congressapp/app/core/constants/sizes.dart';
import 'package:congressapp/app/utils/app_strings.dart';
import 'package:congressapp/presentation/auth/widgets/custom_button.dart';
import 'package:congressapp/presentation/auth/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(title: AppStrings.register),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 20, 12, 40),
          child: Column(
            children: [
              const CustomTextField(hintText: AppStrings.name),
              gapH24,
              const CustomTextField(hintText: AppStrings.email),
              gapH24,
              const CustomTextField(hintText: AppStrings.number),
              gapH24,
              const CustomTextField(hintText: AppStrings.pAddress),
              gapH24,
              const CustomTextField(hintText: AppStrings.tAddress),
              gapH24,
              const CustomTextField(hintText: AppStrings.affilatedUnion),
              gapH24,
              const CustomTextField(hintText: AppStrings.voterID),
              gapH24,
              const CustomTextField(hintText: AppStrings.referralCode),
              gapH32,
              ElevatedButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.white,
                      minimumSize: const Size(120, 40),
                      // maximumSize: const Size(160, 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  child: const Text(AppStrings.clearField)),
              gapH24,
              CustomButton(
                name: AppStrings.register,
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
