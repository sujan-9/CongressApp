import 'dart:async';
import 'package:congressapp/app/init/app_init.dart';
import 'package:congressapp/app/init/my_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  initializeApp();
}

initializeApp() async {
  runZonedGuarded(
    () async {
      await AppInit.initialize();
      runApp(const ProviderScope(child: MyApp()));
    },
    (error, stack) {},
  );
}
