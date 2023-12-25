import 'package:congressapp/app/config/routes/paths/path_root.dart';

import 'package:congressapp/app/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(12.0, 50, 12, 0),
        child: Column(
          children: [
            const Center(
              child: Text(AppStrings.home),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () {
                  context.go(Paths.onboardingScreenRoute.path);
                },
                child: const Text('Home Page'))
          ],
        ),
      ),
    );
  }
}
