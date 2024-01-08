import 'dart:io';
import 'package:congressapp/app/core/common_widgets/custom_appbar.dart';
import 'package:congressapp/app/core/common_widgets/custom_text.dart';
import 'package:congressapp/app/core/constants/pallets.dart';
import 'package:congressapp/app/core/constants/sizes.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;

class AddPolicyScreen extends StatefulWidget {
  const AddPolicyScreen({super.key});

  @override
  State<AddPolicyScreen> createState() => _AddPolicyScreenState();
}

class _AddPolicyScreenState extends State<AddPolicyScreen> {
  final GlobalKey<ScaffoldMessengerState> _scaffoldKey =
      GlobalKey<ScaffoldMessengerState>();

  final TextEditingController policyController = TextEditingController();
  File? selectedImage;
  File? selectedVideo;
  File? policyFile;

  void _submitPolicy() {
    if (policyController.text.isEmpty && selectedImage == null) {
      _scaffoldKey.currentState?.showSnackBar(const SnackBar(
        content:
            Text('Please provide a problem description and select an image.'),
      ));
    } else if (policyController.text.isNotEmpty) {
      policyController.clear();
      setState(() {
        selectedImage = null;
        selectedVideo = null;
        policyFile = null;
      });
      _scaffoldKey.currentState?.showSnackBar(const SnackBar(
        content: Text('Report submitted!'),
      ));
    } else if (policyController.text.isEmpty) {
      _scaffoldKey.currentState?.showSnackBar(const SnackBar(
        content: Text('Please, Describe the policy'),
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
          content: Text('Image selected!'),
        ));
      } else {
        _scaffoldKey.currentState?.showSnackBar(const SnackBar(
          content: Text('Image is too large'),
        ));
      }
    } else {}
  }

  Future<void> _pickVideo() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickVideo(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        selectedVideo = File(pickedImage.path);
      });

      _scaffoldKey.currentState?.showSnackBar(const SnackBar(
        content: Text('Video is selected'),
      ));
    } else {
      _scaffoldKey.currentState?.showSnackBar(const SnackBar(
        content: Text('Error while selecting'),
      ));
    }
  }

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      File file = File(result.files.single.path!);
      setState(() {
        policyFile = file;
      });

      _scaffoldKey.currentState?.showSnackBar(const SnackBar(
        content: Text('File is selected!'),
      ));
    } else {
      _scaffoldKey.currentState?.showSnackBar(const SnackBar(
        content: Text('File is not selected!'),
      ));
    }
  }

  bool _isImageFile(File file) {
    return file.path.toLowerCase().endsWith('.png') ||
        file.path.toLowerCase().endsWith('.jpg') ||
        file.path.toLowerCase().endsWith('.jpeg');
  }

  bool _isVideoFile(File file) {
    return file.path.toLowerCase().endsWith('.mp4') ||
        file.path.toLowerCase().endsWith('.avi') ||
        file.path.toLowerCase().endsWith('.mov');
  }

  bool _isSupportedFile(File file) {
    return file.path.toLowerCase().endsWith('.pdf') ||
        file.path.toLowerCase().endsWith('.doc') ||
        file.path.toLowerCase().endsWith('.txt');
  }

  String trimFileName(File? file) {
    if (file != null || _isSupportedFile(file!)) {
      return path.basename(file.path).trim();
    } else {
      return 'No file selected';
    }
  }

  @override
  void dispose() {
    policyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: 'Add Policy',
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
        padding: const EdgeInsets.fromLTRB(8, 12, 8, 24),
        child: Column(children: [
          Container(
            margin: const EdgeInsets.fromLTRB(8, 12, 8, 12),
            padding: const EdgeInsets.fromLTRB(16, 12, 8, 12),
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
              children: [
                TextField(
                  controller: policyController,
                  decoration: const InputDecoration(
                    hintText: 'Write Policies',
                    hintStyle: TextStyle(fontSize: 18),
                  ),
                  maxLines: 8,
                ),
                gapH16,
                InkWell(
                    onTap: () {
                      _pickImage();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CustomText.medium('Upload Image'),
                        const Icon(Icons.camera_alt_rounded),
                      ],
                    )),
                gapH12,
                selectedImage != null && _isImageFile(selectedImage!)
                    ? SizedBox(
                        height: 90,
                        // width: 100,
                        child: Image.file(selectedImage!),
                      )
                    : const SizedBox.shrink(),
                const Divider(
                  color: Colors.grey,
                  thickness: 1,
                ),
                gapH16,
                InkWell(
                    onTap: () {
                      _pickVideo();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CustomText.medium('Upload video'),
                        const Icon(Icons.video_camera_front_rounded),
                      ],
                    )),
                gapH12,
                selectedVideo != null && _isVideoFile(selectedVideo!)
                    ? SizedBox(
                        height: 60,
                        // width: 100,
                        child: Image.file(selectedImage!),
                      )
                    : const SizedBox.shrink(),
                const Divider(
                  color: Colors.grey,
                  thickness: 1,
                ),
                gapH12,
                InkWell(
                    onTap: () {
                      _pickFile();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CustomText.medium('Upload files'),
                        const Icon(Icons.file_copy_rounded),
                      ],
                    )),
                gapH16,
                policyFile != null && _isSupportedFile(policyFile!)
                    ? SizedBox(
                        height: 60,
                        child: CustomText.medium(
                          trimFileName(policyFile),
                          color: redColor,
                        ),
                      )
                    : const SizedBox.shrink(),
                const Divider(
                  color: Colors.grey,
                  thickness: 1,
                ),
              ],
            ),
          ),
          gapH32,
          ElevatedButton(
            style: TextButton.styleFrom(
                backgroundColor: greenColor,
                minimumSize: const Size(150, 50),
                maximumSize: const Size(180, 60),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
            onPressed: () {
              _submitPolicy();
            },
            child: const Text(
              'Submit',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          )
        ]),
      ),
    );
  }
}
