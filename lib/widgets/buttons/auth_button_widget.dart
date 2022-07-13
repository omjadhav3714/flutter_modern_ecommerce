import 'package:flutter/material.dart';
import 'package:modern_ecommerce/constants/colors.dart';

class AuthButton extends StatelessWidget {
  final String label;
  final void Function() onPress;
  final Color? color;
  const AuthButton({
    required this.label,
    this.color,
    required this.onPress,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            color: color ?? white,
            fontSize: 27,
            fontWeight: FontWeight.w700,
          ),
        ),
        CircleAvatar(
          radius: 30,
          backgroundColor: primaryColor,
          child: IconButton(
            color: white,
            onPressed: onPress,
            icon: const Icon(
              Icons.arrow_forward,
            ),
          ),
        )
      ],
    );
  }
}
