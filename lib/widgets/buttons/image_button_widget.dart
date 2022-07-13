import 'package:flutter/material.dart';
import 'package:modern_ecommerce/constants/colors.dart';

class CustomImageButton extends StatelessWidget {
  final String label;
  final String data;
  final void Function() onPress;
  const CustomImageButton({
    required this.label,
    required this.data,
    required this.onPress,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(white),
      ),
      onPressed: onPress,
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: white,
            radius: 20,
            child: Image.asset(
              data,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            label,
            style: const TextStyle(fontSize: 15, color: black),
          )
        ],
      ),
    );
  }
}
