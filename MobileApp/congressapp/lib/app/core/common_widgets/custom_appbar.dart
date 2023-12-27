//import 'package:congressapp/app/core/common_widgets/custom_text.dart';
import 'package:congressapp/app/core/constants/pallets.dart';
import 'package:congressapp/app/core/constants/sizes.dart';
import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({
    super.key,
    required this.title,
    this.icon,
  });

  final String title;
  final IconButton? icon;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: redColor,
      leading: icon ?? const SizedBox.shrink(),
      // const Icon(
      //   Icons.arrow_back_ios_new_rounded,
      //   color: Colors.white,
      // ),
      toolbarHeight: 80,
      titleSpacing: 0,
      title:
          //CustomText.large(title),
          Text(
        title,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: Sizes.p24, color: whiteColor),
      ),
      centerTitle: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(15),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(90);
}
