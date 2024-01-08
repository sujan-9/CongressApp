import 'package:congressapp/app/config/routes/path_root.dart';
import 'package:congressapp/app/config/routes/router.dart';
import 'package:congressapp/app/core/common_widgets/custom_appbar.dart';

import 'package:congressapp/app/core/constants/sizes.dart';
import 'package:congressapp/app/utils/app_strings.dart';
import 'package:congressapp/app/utils/asset_provider.dart';
import 'package:congressapp/data/models/usermodel.dart';

import 'package:congressapp/presentation/auth/widgets/custom_button.dart';
import 'package:congressapp/presentation/auth/widgets/custom_textfield.dart';
import 'package:congressapp/presentation/profile/pages/widgets/contact_info.dart';
import 'package:congressapp/presentation/profile/provider/profileinfo_provider.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ProfilePage extends ConsumerWidget {
  // final UserModel userinfo;
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
        body: Consumer(builder: (context, ref, child) {
          final userinfo = ref.watch(profileinfoProvider);
          return SingleChildScrollView(
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
                        AppRouter.router.pushNamed(
                            Paths.editProfilePageScreenRoute.routeName);
                      }),
                  gapH20,
                  CustomTextField(
                    hintText: userinfo.name,
                    label: const Text(AppStrings.nameP),
                    readOnly: true,
                    focus: false,
                  ),
                  gapH20,
                  CustomTextField(
                    hintText: userinfo.address,
                    label: const Text(AppStrings.addressP),
                    readOnly: true,
                    focus: false,
                  ),
                  gapH20,
                  CustomTextField(
                    hintText: userinfo.post,
                    label: const Text(AppStrings.post),
                    readOnly: true,
                    focus: false,
                  ),
                  gapH20,
                  ContactInfo(
                    email: userinfo.email,
                    phone: userinfo.phone.toString(),
                  ),
                ],
              ));
        }));
  }
}
