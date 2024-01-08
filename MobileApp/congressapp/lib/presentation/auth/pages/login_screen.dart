import 'package:congressapp/app/config/routes/path_root.dart';
import 'package:congressapp/app/core/common_widgets/custom_text.dart';

import 'package:congressapp/app/core/constants/pallets.dart';
import 'package:congressapp/app/core/constants/sizes.dart';
import 'package:congressapp/app/utils/app_strings.dart';
import 'package:congressapp/presentation/auth/widgets/custom_button.dart';
import 'package:congressapp/presentation/auth/widgets/custom_textfield.dart';
import 'package:congressapp/presentation/auth/widgets/forget_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  @override
  void dispose() {
    _emailController.dispose();
    _passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: redColor,
        leading: const Align(
          heightFactor: 10,
          alignment: Alignment.topLeft,
          child: Padding(
            padding: EdgeInsets.only(top: 20, left: 10),
            child: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.white,
            ),
          ),
        ),
        title: const Text(
          AppStrings.login,
          style: TextStyle(fontSize: Sizes.p24, color: whiteColor),
        ),
        toolbarHeight: 220,
        shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.vertical(bottom: Radius.elliptical(width, 85))),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 50, 16, 12),
        child: Column(
          children: [
            CustomTextField(
              controller: _emailController,
              hintText: AppStrings.username,
              prefixIcon: const SizedBox(
                child: Center(
                    widthFactor: 0.0, child: Icon(Icons.person_2_rounded)),
              ),
            ),
            gapH24,
            CustomTextField(
              controller: _passController,
              hintText: AppStrings.password,
              prefixIcon: const SizedBox(
                child: Center(
                    widthFactor: 0.0, child: Icon(Icons.lock_outline_rounded)),
              ),
            ),
            const Align(
                alignment: Alignment.bottomRight, child: ForgetPassword()),
            gapH12,
            CustomButton(
              name: AppStrings.login,
              onPressed: () {
                context.go(Paths.homePageScreenRoute.path);
              },
            ),
            gapH32,
            TextButton(
                onPressed: () {
                  context.go(Paths.registerScreenRoute.path);
                },
                child: CustomText.medium(
                  'Create an account',
                  color: redColor,
                )),
          ],
        ),
      )),
    );
  }
}
