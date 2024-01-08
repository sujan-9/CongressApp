import 'package:congressapp/app/config/routes/path_root.dart';

import 'package:congressapp/app/core/common_widgets/custom_appbar.dart';
import 'package:congressapp/app/core/constants/sizes.dart';
import 'package:congressapp/data/models/usermodel.dart';
import 'package:congressapp/presentation/auth/widgets/custom_button.dart';
import 'package:congressapp/presentation/auth/widgets/custom_textfield.dart';
import 'package:congressapp/presentation/profile/pages/widgets/custom_avatar.dart';
import 'package:congressapp/presentation/profile/provider/profileinfo_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class EditProfilePage extends ConsumerStatefulWidget {
  const EditProfilePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _EditProfilePageState();
}

class _EditProfilePageState extends ConsumerState<EditProfilePage> {
  // final GlobalKey<ScaffoldMessengerState> _scaffoldKey =
  //     GlobalKey<ScaffoldMessengerState>();
  final namecontroller = TextEditingController();
  final addresscontroller = TextEditingController();
  final phonecontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  final postcontroller = TextEditingController();

  @override
  void dispose() {
    namecontroller.dispose();
    addresscontroller.dispose();
    phonecontroller.dispose();
    emailcontroller.dispose();
    postcontroller.dispose();
    super.dispose();
  }

  _submit() {
    final updatedProfile = UserModel(
      name: namecontroller.text,
      address: addresscontroller.text,
      phone: int.tryParse(phonecontroller.text) ?? 0,
      email: emailcontroller.text,
      post: postcontroller.text,
    );
    ref.read(profileinfoProvider.notifier).updateProfile(updatedProfile);
    context.goNamed(Paths.profilePageScreenRoute.routeName,
        extra: updatedProfile);

    // if (userIsUnchanged(updatedProfile)) {
    //   // Show a Snackbar if the user didn't make any changes
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     const SnackBar(
    //       content: Text('Please update information to make changes.'),
    //     ),
    //   );
    // } else {
    //   // Update the profile if there are changes
    //   ref.read(profileinfoProvider.notifier).updateProfile(updatedProfile);
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     const SnackBar(
    //       content: Text('Profile updated successfully!'),
    //     ),
    //   );
    //   context.goNamed(Paths.profilePageScreenRoute.routeName);
    // }
  }

  // bool userIsUnchanged(UserModel updatedProfile) {
  //   final currentProfile = ref.read(profileinfoProvider);
  //   return updatedProfile.name == currentProfile.name &&
  //       updatedProfile.address == currentProfile.address &&
  //       updatedProfile.phone == currentProfile.phone &&
  //       updatedProfile.email == currentProfile.email &&
  //       updatedProfile.post == currentProfile.post;
  // }

  @override
  Widget build(BuildContext context) {
    final userinfo = ref.watch(profileinfoProvider);
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
            CustomTextField(
              hintText: userinfo.name,
              controller: namecontroller,
            ),
            gapH16,
            CustomTextField(
              hintText: userinfo.address,
              controller: addresscontroller,
            ),
            gapH16,
            CustomTextField(
              hintText: userinfo.post,
              controller: postcontroller,
            ),
            gapH16,
            CustomTextField(
              hintText: userinfo.phone.toString(),
              controller: phonecontroller,
            ),
            gapH16,
            CustomTextField(
              hintText: userinfo.email,
              controller: emailcontroller,
            ),
            gapH24,
            CustomButton(
                name: 'Save Changes',
                onPressed: () {
                  //  _submit();
                }),
          ],
        ),
      ),
    );
  }
}
