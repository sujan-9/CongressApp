import 'package:congressapp/app/core/common_widgets/custom_appbar.dart';
import 'package:congressapp/app/core/constants/sizes.dart';
import 'package:congressapp/presentation/auth/widgets/custom_button.dart';
import 'package:congressapp/presentation/auth/widgets/custom_textfield.dart';
import 'package:congressapp/presentation/profile/pages/widgets/custom_avatar.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: 'Edit Profile',
        icon: IconButton(
            onPressed: () {
              context.pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.white,
            )),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(12, 18, 12, 20),
        child: Column(
          children: [
            const CustomEditAvatar(),
            gapH20,
            const CustomTextField(
              hintText: 'Name',
            ),
            gapH16,
            const CustomTextField(hintText: 'Address'),
            gapH16,
            const CustomTextField(hintText: 'Post'),
            gapH16,
            const CustomTextField(hintText: 'Phone'),
            gapH16,
            const CustomTextField(hintText: 'Email'),
            gapH24,
            CustomButton(name: 'Save Changes', onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
