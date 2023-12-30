import 'package:congressapp/app/core/common_widgets/custom_text.dart';
import 'package:congressapp/app/utils/asset_provider.dart';
import 'package:flutter/material.dart';

class TopnewsPage extends StatelessWidget {
  const TopnewsPage({super.key});

  String _getCurrentTimestamp() {
    DateTime now = DateTime.now();
    String formattedTime = '${now.hour}:${now.minute}';
    return formattedTime;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 4,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.fromLTRB(12, 12, 12, 12),
          padding: const EdgeInsets.fromLTRB(24, 8, 12, 8),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 2,
                  offset: const Offset(0, 2),
                ),
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText.medium(_getCurrentTimestamp()),
              Padding(
                  padding: const EdgeInsets.fromLTRB(48, 12, 0, 12),
                  child: SizedBox(height: 220, child: AssetProvider.logo)),
              CustomText.large('news title'),
            ],
          ),
        );
      },
    );
  }
}
