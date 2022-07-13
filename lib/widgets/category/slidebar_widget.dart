import 'package:flutter/material.dart';
import 'package:modern_ecommerce/constants/colors.dart';
import 'package:modern_ecommerce/constants/strings.dart';

class SlideBar extends StatelessWidget {
  final String catName;
  const SlideBar({
    Key? key,
    required this.size,
    required this.catName,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * 0.8,
      width: size.width * 0.05,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40),
        child: Container(
          decoration: BoxDecoration(
            color: black.withOpacity(0.2),
            borderRadius: BorderRadius.circular(50),
          ),
          child: RotatedBox(
            quarterTurns: 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                catName == accessories
                    ? const Text('')
                    : const SlideBarTextWidget(label: forward),
                SlideBarTextWidget(label: catName),
                catName == men
                    ? const Text('')
                    : const SlideBarTextWidget(label: backward),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SlideBarTextWidget extends StatelessWidget {
  final String label;
  const SlideBarTextWidget({
    Key? key,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: const TextStyle(
          color: black,
          fontSize: 16,
          fontWeight: FontWeight.w600,
          letterSpacing: 10),
    );
  }
}
