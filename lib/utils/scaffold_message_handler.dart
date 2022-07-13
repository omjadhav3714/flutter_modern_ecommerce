import 'package:flutter/material.dart';
import 'package:modern_ecommerce/constants/colors.dart';

class MessageHandler {
  static void showSnackBar(var _scaffoldKey, String message) {
    _scaffoldKey.currentState.hideCurrentSnackBar();
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        backgroundColor: primaryColor,
        duration: const Duration(seconds: 2),
        content: Text(
          message,
          style: const TextStyle(
            fontSize: 18,
            color: white,
          ),
        ),
      ),
    );
  }
}
