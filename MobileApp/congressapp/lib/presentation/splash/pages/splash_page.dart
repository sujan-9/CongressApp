import 'package:congressapp/app/utils/asset_provider.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(12),
        child: Center(
          child: SizedBox(width: 180, child: AssetProvider.logo),
        ),
      ),
    );
  }
}
