import 'package:congressapp/app/utils/asset_provider.dart';
import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget {
  const ImageContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 300,
      margin: const EdgeInsets.fromLTRB(12, 16, 12, 8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 2,
              offset: const Offset(0, 2), // changes the position of the shadow
            ),
          ]),
      child: AssetProvider.logo,
    );
  }
}
