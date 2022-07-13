import 'package:flutter/material.dart';
import 'package:modern_ecommerce/constants/colors.dart';

class ProfileData extends StatelessWidget {
  final String label;
  final String labelData;
  final IconData data;
  const ProfileData({
    required this.label,
    required this.data,
    required this.labelData,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                data,
                color: black.withOpacity(0.5),
                size: 24,
              ),
              Column(
                children: [
                  Text(
                    label.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    labelData,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.arrow_forward_ios,
                    color: black.withOpacity(0.5),
                    size: 17,
                  )
                ],
              )
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Divider(
            color: grey.withOpacity(0.8),
          )
        ],
      ),
    );
  }
}
