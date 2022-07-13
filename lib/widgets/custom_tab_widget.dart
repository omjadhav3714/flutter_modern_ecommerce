// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:modern_ecommerce/constants/colors.dart';

class CustomTabWidget extends StatelessWidget {
  final String label;
  const CustomTabWidget({
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Text(
        label,
        style: const TextStyle(color: black),
      ),
    );
  }
}
