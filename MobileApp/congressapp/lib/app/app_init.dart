import 'package:flutter/widgets.dart';

class AppInit {
  static Future initialize() async {
    WidgetsFlutterBinding.ensureInitialized();
  }
}
