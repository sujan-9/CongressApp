import 'package:congressapp/app/core/common_widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class PollPage extends StatelessWidget {
  const PollPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppbar(title: 'Poll Page'),
      body: Center(
        child: Text("Poll Page"),
      ),
    );
  }
}
