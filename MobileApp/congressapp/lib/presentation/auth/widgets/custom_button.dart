import 'package:congressapp/app/core/constants/pallets.dart';

import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.name, required this.onPressed});

  final String name;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: TextButton.styleFrom(
          backgroundColor: greenColor,
          minimumSize: const Size(150, 50),
          // maximumSize: const Size(160, 50),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
      onPressed: onPressed,
      child: Text(
        name,
        style: const TextStyle(color: Colors.white, fontSize: 18),
      ),
    );
  }
}
