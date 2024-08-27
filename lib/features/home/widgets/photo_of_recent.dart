import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:driver_flutter/features/home/widgets/label_text.dart';
import 'package:driver_flutter/shared/colors/app_colors.dart';
import 'package:driver_flutter/shared/widgets/show_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';

class PhotoOfRecept extends StatefulWidget {
  const PhotoOfRecept({
    super.key,
    this.onPressed,
    this.image,
  });

  final VoidCallback? onPressed;
  final File? image;

  @override
  State<PhotoOfRecept> createState() => _PhotoOfReceptState();
}

class _PhotoOfReceptState extends State<PhotoOfRecept> {
  File? imageFile;

  Future<void> pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      final imageTemporary = File(image.path);
      setState(() {
        imageFile = imageTemporary;
      });
    } catch (e) {
      print(e);
    }
  }

  void selectOptionOpenCamera() {
    ShowDialogWidget.showDialogOpenCamera(
      context: context,
      onTapCamera: () {
        context.pop(context);
        pickImage(ImageSource.camera);
      },
      onTapGallery: () {
        context.pop(context);
        pickImage(ImageSource.gallery);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        const LabelTextPay(label: 'Photo of Recent'),
        const SizedBox(height: 10),
        GestureDetector(
          onTap: widget.onPressed,
          child: SizedBox(
            width: double.infinity,
            child: DottedBorder(
              borderType: BorderType.RRect,
              radius: const Radius.circular(8),
              color: AppColors.kPrimaryColor,
              strokeWidth: 1,
              dashPattern: const [6, 6],
              child: Center(
                child: SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          selectOptionOpenCamera();
                        },
                        child: imageFile != null
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.file(
                                  imageFile!,
                                  //fit: BoxFit.contain,
                                ),
                              )
                            : Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 16,
                                  horizontal: 16,
                                ),
                                child: Column(
                                  children: [
                                    Lottie.asset(
                                      'assets/animations/upload.json',
                                      width: 120,
                                      height: 80,
                                    ),
                                    const Text(
                                      'Upload Photo',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: AppColors.kColorBlack,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                  ],
                                ),
                              ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
