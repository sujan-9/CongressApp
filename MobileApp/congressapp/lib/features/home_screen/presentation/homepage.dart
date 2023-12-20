import 'package:congressapp/core/common_widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../config/routes/paths.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(12.0, 50, 12, 0),
        child: Column(
          children: [
            const CustomTextField(),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () {
                  context.go(Paths.onboardingScreenRoute.path);
                },
                child: const Text('Next Page'))
          ],
        ),
      ),
    );
  }
}
