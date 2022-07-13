import 'package:flutter/material.dart';
import 'package:modern_ecommerce/constants/colors.dart';

class CustomImagePickerWidget extends StatelessWidget {
  final void Function() pickGallery;
  final void Function() pickCamera;
  const CustomImagePickerWidget({
    required this.pickGallery,
    required this.pickCamera,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
          ),
          child: IconButton(
            onPressed: () {
              pickCamera();
            },
            color: white,
            icon: const Icon(
              Icons.camera,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          decoration: const BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ),
          ),
          child: IconButton(
            onPressed: () {
              pickGallery();
            },
            color: white,
            icon: const Icon(
              Icons.image,
            ),
          ),
        ),
      ],
    );
  }
}
