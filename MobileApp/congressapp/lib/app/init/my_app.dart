import 'package:flutter/material.dart';

import '../config/routes/router.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
      theme: ThemeData(
        useMaterial3: true,
      ),
    );
  }
}
