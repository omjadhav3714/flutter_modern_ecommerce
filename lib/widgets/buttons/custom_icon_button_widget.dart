import 'package:flutter/material.dart';
import 'package:modern_ecommerce/constants/colors.dart';

class CustomIconButton extends StatelessWidget {
  final String label;
  final IconData data;
  final void Function() onPress;
  final double? size;
  const CustomIconButton({
    required this.label,
    required this.data,
    required this.onPress,
    this.size,
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
          Icon(
            data,
            color: primaryColor,
            size: size ?? 25,
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
