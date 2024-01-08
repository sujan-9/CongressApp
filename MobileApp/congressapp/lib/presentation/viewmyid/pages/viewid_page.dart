import 'package:congressapp/app/core/common_widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ViewMyIDScreen extends StatelessWidget {
  const ViewMyIDScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: 'View My ID',
        icon: IconButton(
            onPressed: () {
              context.pop();
            },
            icon: const Icon(Icons.arrow_back_ios_new_rounded)),
      ),
    );
  }
}
