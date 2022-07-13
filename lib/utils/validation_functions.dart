import 'package:modern_ecommerce/constants/strings.dart';

String? validatePassword(String? value) {
  RegExp regex =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
  if (value!.isEmpty) {
    return enterPassword;
  } else {
    if (!regex.hasMatch(value)) {
      return validPassword;
    } else {
      return null;
    }
  }
}

String? validateEmail(String? value) {
  RegExp regex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  if (value!.isEmpty) {
    return enterEmail;
  } else {
    if (!regex.hasMatch(value)) {
      return validEmail;
    } else {
      return null;
    }
  }
}

String? validateText(String? value) {
  if (value!.isEmpty) {
    return validValue;
  } else {
    return null;
  }
}
