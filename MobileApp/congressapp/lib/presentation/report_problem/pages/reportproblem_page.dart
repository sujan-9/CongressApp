// ignore_for_file: file_names

import 'dart:io';
import 'package:congressapp/app/core/common_widgets/custom_appbar.dart';
import 'package:congressapp/app/core/constants/pallets.dart';
import 'package:congressapp/app/core/constants/sizes.dart';
import 'package:congressapp/app/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

class ReportProblemScreen extends StatefulWidget {
  const ReportProblemScreen({super.key});

  @override
  State<ReportProblemScreen> createState() => _SettingPageState();
}

class _SettingPageState extends State<ReportProblemScreen> {
  final GlobalKey<ScaffoldMessengerState> _scaffoldKey =
      GlobalKey<ScaffoldMessengerState>();

  TextEditingController problemController = TextEditingController();
  File? selectedImage;

  void _submitReport() {
    if (problemController.text.isEmpty && selectedImage == null) {
      _scaffoldKey.currentState?.showSnackBar(const SnackBar(
        content:
            Text('Please provide a problem description and select an image.'),
      ));
    } else if (problemController.text.isNotEmpty && selectedImage != null) {
      problemController.clear();
      setState(() {
        selectedImage = null;
      });
      _scaffoldKey.currentState?.showSnackBar(const SnackBar(
        content: Text('Report Submitted'),
      ));
    } else if (problemController.text.isNotEmpty && selectedImage == null) {
      problemController.clear();

      _scaffoldKey.currentState?.showSnackBar(const SnackBar(
        content: Text('Report Submitted'),
      ));
    } else if (problemController.text.isEmpty) {
      _scaffoldKey.currentState?.showSnackBar(const SnackBar(
        content: Text('Please describe the problem'),
      ));
    }
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      int imageSizeInBytes = File(pickedImage.path).lengthSync();
      double imageSizeInKB = imageSizeInBytes / 1024;

      if (imageSizeInKB < 1024) {
        setState(() {
          selectedImage = File(pickedImage.path);
        });

        _scaffoldKey.currentState?.showSnackBar(const SnackBar(
          content: Text('Image selected'),
        ));
      } else {
        _scaffoldKey.currentState?.showSnackBar(const SnackBar(
          content: Text('Image is too large'),
        ));
      }
    } else {}
  }

  @override
  void dispose() {
    problemController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: AppStrings.reportProblem,
        icon: IconButton(
            onPressed: () {
              context.pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.white,
            )),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: problemController,
              decoration: InputDecoration(
                labelText: 'Describe the problem',
                labelStyle: const TextStyle(fontSize: 18),
                alignLabelWithHint: true,
                floatingLabelAlignment: FloatingLabelAlignment.center,
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Color.fromARGB(255, 0, 0, 3),
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Color.fromARGB(217, 29, 170, 55),
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
              ),
              maxLines: 5,
            ),
            gapH32,
            ElevatedButton(
              style: TextButton.styleFrom(
                //backgroundColor: greenColor,
                minimumSize: const Size(150, 50),
                maximumSize: const Size(200, 90),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: _pickImage,
              child: const Text('Select Image'),
            ),
            gapH12,
            selectedImage != null
                ? Image.file(
                    selectedImage!,
                    height: 150,
                    fit: BoxFit.cover,
                  )
                : const SizedBox(
                    height: 200,
                  ),
            gapH64,
            ElevatedButton(
              style: TextButton.styleFrom(
                  backgroundColor: greenColor,
                  minimumSize: const Size(150, 50),
                  maximumSize: const Size(200, 90),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              onPressed: () {
                _submitReport();
              },
              child: const Text(
                'Submit',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            )
          ],
        ),
      ),
    );
  }
}
