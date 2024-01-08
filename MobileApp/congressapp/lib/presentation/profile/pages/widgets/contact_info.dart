import 'package:congressapp/app/core/common_widgets/custom_text.dart';
import 'package:congressapp/app/core/constants/pallets.dart';
import 'package:congressapp/app/core/constants/sizes.dart';
import 'package:flutter/material.dart';

class ContactInfo extends StatelessWidget {
  final String phone;
  final String email;
  const ContactInfo({super.key, required this.phone, required this.email});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 2,
              offset: const Offset(0, 2), // changes the position of the shadow
            ),
          ]),
      child: TextFormField(
        //  controller: ,

        style: const TextStyle(fontSize: 16.0),
        decoration: InputDecoration(
          label: const Text('Contact info'),
          enabled: false,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelStyle: const TextStyle(
            color: redColor,
            fontSize: Sizes.p18,
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color.fromARGB(255, 0, 0, 3),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.fromLTRB(12, 16, 12, 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Column(
                  children: [
                    Icon(Icons.call_end_rounded),
                    gapH16,
                    Icon(Icons.email_rounded),
                  ],
                ),
                gapW24,
                Column(
                  children: [
                    CustomText.small(phone),
                    gapH16,
                    CustomText.small(email),
                  ],
                ),
              ],
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color.fromARGB(255, 0, 0, 3),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color.fromARGB(217, 29, 41, 170),
              width: 2,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color.fromARGB(204, 39, 152, 17),
              width: 2,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color.fromARGB(204, 200, 30, 30),
              width: 2,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color.fromARGB(204, 200, 30, 30),
              width: 2,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          contentPadding: const EdgeInsetsDirectional.fromSTEB(16, 24, 0, 24),
        ),
      ),
    );
  }
}
