import 'package:flutter/material.dart';
import 'package:modern_ecommerce/constants/colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController ctrl;
  final bool? obs;
  final String hintTxt;
  final Color? colorT;
  final String? Function(String?)? validate;
  const CustomTextField({
    this.obs,
    this.colorT,
    required this.ctrl,
    required this.hintTxt,
    required this.validate,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: colorT ?? white),
      obscureText: obs ?? false,
      controller: ctrl,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: colorT ?? white,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: black,
          ),
        ),
        hintText: hintTxt,
        hintStyle: TextStyle(color: colorT ?? white),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      validator: validate,
    );
  }
}
