import 'package:congressapp/app/core/common_widgets/custom_appbar.dart';
import 'package:congressapp/app/core/common_widgets/custom_text.dart';
import 'package:congressapp/app/core/constants/sizes.dart';
import 'package:congressapp/app/utils/app_strings.dart';
import 'package:congressapp/app/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: AppStrings.setting,
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
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText.large("General").addPadding(4),
            gapH4,
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 2,
                      offset: const Offset(0, 2),
                    ),
                  ]),
              child: Column(
                children: [
                  InkWell(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText.medium('Language'),
                      const Icon(Icons.arrow_forward_ios_rounded),
                    ],
                  )),
                  gapH4,
                  const Divider(
                    color: Colors.grey,
                    thickness: 1,
                  ),
                  gapH12,
                  InkWell(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText.medium('Theme'),
                      const Icon(Icons.arrow_forward_ios_rounded),
                    ],
                  )),
                  gapH4,
                  const Divider(
                    color: Colors.grey,
                    thickness: 1,
                  ),
                  gapH12,
                  InkWell(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText.medium('Notification'),
                      const Icon(Icons.arrow_forward_ios_rounded),
                    ],
                  )),
                ],
              ),
            ),
            gapH24,
            CustomText.large("Account").addPadding(4),
            gapH4,
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 2,
                      offset: const Offset(0, 2),
                    ),
                  ]),
              child: Column(
                children: [
                  InkWell(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText.medium('Change Password'),
                      const Icon(Icons.arrow_forward_ios_rounded),
                    ],
                  )),
                  gapH4,
                  const Divider(
                    color: Colors.grey,
                    thickness: 1,
                  ),
                  gapH12,
                  InkWell(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText.medium('Delete Account'),
                      const Icon(Icons.arrow_forward_ios_rounded),
                    ],
                  )),
                ],
              ),
            ),
            gapH24,
            CustomText.large('App').addPadding(4),
            gapH4,
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 2,
                      offset: const Offset(0, 2),
                    ),
                  ]),
              child: Column(
                children: [
                  InkWell(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText.medium(
                        'About Us',
                      ),
                      const Icon(Icons.arrow_forward_ios_rounded),
                    ],
                  )),
                  gapH4,
                  const Divider(
                    color: Colors.grey,
                    thickness: 1,
                  ),
                  gapH12,
                  InkWell(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText.medium('Privacy Policy'),
                      const Icon(Icons.arrow_forward_ios_rounded),
                    ],
                  )),
                  gapH4,
                  const Divider(
                    color: Colors.grey,
                    thickness: 1,
                  ),
                  gapH12,
                  InkWell(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText.medium('Terms & Conditions'),
                      const Icon(Icons.arrow_forward_ios_rounded),
                    ],
                  )),
                  gapH4,
                  const Divider(
                    color: Colors.grey,
                    thickness: 1,
                  ),
                  gapH12,
                  InkWell(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText.medium('Contact Us'),
                      const Icon(Icons.arrow_forward_ios_rounded),
                    ],
                  )),
                  gapH4,
                  const Divider(
                    color: Colors.grey,
                    thickness: 1,
                  ),
                  gapH12,
                  InkWell(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText.medium('Help'),
                      const Icon(Icons.arrow_forward_ios_rounded),
                    ],
                  )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
