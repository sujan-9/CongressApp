import 'package:congressapp/app/core/common_widgets/custom_appbar.dart';
import 'package:congressapp/app/core/common_widgets/custom_text.dart';
import 'package:congressapp/app/core/constants/pallets.dart';
import 'package:congressapp/app/utils/app_strings.dart';

import 'package:congressapp/presentation/polls/widgets/custom_container.dart';
import 'package:flutter/material.dart';

class PollPage extends StatefulWidget {
  const PollPage({super.key});

  @override
  State<PollPage> createState() => _PollPageState();
}

class _PollPageState extends State<PollPage> {
  int selectedOption = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppbar(
          title: AppStrings.calenderTitle,
        ),
        body: ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: 5,
            itemBuilder: (context, index) {
              return CustomPollContainer(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CustomText.medium('Do you have voter id?'),
                    RadioListTile(
                      activeColor: redColor,
                      title: const Text('Yes'),
                      value: 1,
                      groupValue: selectedOption,
                      onChanged: (value) {
                        setState(() {
                          selectedOption = value!;
                        });
                      },
                    ),
                    RadioListTile(
                      activeColor: redColor,
                      title: const Text('No'),
                      value: 2,
                      groupValue: selectedOption,
                      onChanged: (value) {
                        setState(() {
                          selectedOption = value!;
                        });
                      },
                    ),
                    RadioListTile(
                      activeColor: redColor,
                      title: const Text('Lost'),
                      value: 3,
                      groupValue: selectedOption,
                      onChanged: (value) {
                        setState(() {
                          selectedOption = value!;
                        });
                      },
                    ),
                  ],
                ),
              );
            }));
  }
}
