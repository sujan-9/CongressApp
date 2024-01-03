import 'package:congressapp/app/config/routes/paths/path_root.dart';
import 'package:congressapp/app/config/routes/router.dart';
import 'package:congressapp/app/core/common_widgets/custom_appbar.dart';

import 'package:congressapp/app/core/constants/sizes.dart';
import 'package:congressapp/app/utils/app_strings.dart';
import 'package:congressapp/app/utils/asset_provider.dart';

import 'package:congressapp/presentation/auth/widgets/custom_button.dart';
import 'package:congressapp/presentation/auth/widgets/custom_textfield.dart';
import 'package:congressapp/presentation/profile/pages/widgets/contact_info.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: AppStrings.profile,
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
          padding: const EdgeInsets.fromLTRB(12, 20, 12, 12),
          child: Column(
            children: [
              CircleAvatar(
                radius: 65,
                child: AssetProvider.logo,
              ),
              gapH32,
              CustomButton(
                  name: AppStrings.editProfile,
                  onPressed: () {
                    //context.push(Paths.editProfilePageScreenRoute.path);
                    AppRouter.router
                        .pushNamed(Paths.editProfilePageScreenRoute.routeName);
                  }),
              gapH20,
              const CustomTextField(
                hintText: 'Avishek Giri',
                label: Text(AppStrings.nameP),
                readOnly: true,
                focus: false,
              ),
              gapH20,
              const CustomTextField(
                hintText: ' Pokhara',
                label: Text(AppStrings.addressP),
                readOnly: true,
                focus: false,
              ),
              gapH20,
              const CustomTextField(
                hintText: 'Engineer',
                label: Text(AppStrings.post),
                readOnly: true,
                focus: false,
              ),
              gapH20,
              const ContactInfo(),
            ],
          )),
    );
  }
}
