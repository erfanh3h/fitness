import 'package:get/get.dart';

class Validators {
  static String? validateName(String value) {
    if (value.isEmpty) {
      return "This Field Required!";
    }
    return null;
  }

  static String? validateEmail(String value) {
    if (value.isEmpty) {
      return "Enter Your Email";
    }
    if (!GetUtils.isEmail(value)) {
      return 'Invalid email';
    }
    return null;
  }

  static String? validatePassword(String value) {
    if (value.isEmpty) {
      return "Enter Your Password";
    } else if (value.length < 8) {
      return "The password must be more than 8 digits";
    }
    return null;
  }
}
