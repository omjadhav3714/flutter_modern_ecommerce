import 'package:flutter/material.dart';
import 'package:modern_ecommerce/constants/colors.dart';

class HyphenTextHeader extends StatelessWidget {
  final String head;
  const HyphenTextHeader({
    Key? key,
    required this.head,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 40,
            width: 50,
            child: Divider(
              thickness: 1,
              color: primaryColor,
            ),
          ),
          Text(
            head,
            style: const TextStyle(
              color: primaryColor,
              fontSize: 24,
            ),
          ),
          const SizedBox(
            height: 40,
            width: 50,
            child: Divider(
              thickness: 1,
              color: primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
