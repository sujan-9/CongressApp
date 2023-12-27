import 'package:congressapp/app/core/constants/pallets.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomEditAvatar extends StatelessWidget {
  const CustomEditAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      radius: 70,
      backgroundImage: AssetImage('assets/images/logo.png'),
      child: Stack(children: [
        Align(
          alignment: Alignment.bottomRight,
          child: CircleAvatar(
            radius: 18,
            backgroundColor: Colors.white70,
            child: Icon(
              CupertinoIcons.camera,
              color: redColor,
            ),
          ),
        ),
      ]),
    );
  }
}
