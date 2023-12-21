import 'package:congressapp/app/locator/di.dart';
import 'package:flutter/widgets.dart';

class AppInit {
  static Future initialize() async {
    WidgetsFlutterBinding.ensureInitialized();
    await setupLocator();
  }
}
