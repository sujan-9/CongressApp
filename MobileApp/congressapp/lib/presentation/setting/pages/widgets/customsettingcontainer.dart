import 'package:congressapp/app/core/common_widgets/custom_text.dart';
import 'package:congressapp/app/core/constants/sizes.dart';
import 'package:flutter/material.dart';

class CustomSettingContainer extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const CustomSettingContainer(
      {super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
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
              onTap: onTap,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText.medium(text),
                  const Icon(Icons.arrow_forward_ios_rounded),
                ],
              )),
          const Divider(
            color: Colors.grey,
            thickness: 1,
          ),
        ],
      ),
    );
  }
}
