import 'package:congressapp/app/core/common_widgets/custom_appbar.dart';
import 'package:congressapp/app/utils/app_strings.dart';
import 'package:congressapp/presentation/gallery/pages/widgets/image_container.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: AppStrings.partyGallery,
        icon: IconButton(
            onPressed: () {
              context.pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.white,
            )),
      ),
      body: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return const ImageContainer();
          }),
    );
  }
}
