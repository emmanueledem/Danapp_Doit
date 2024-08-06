import 'package:danapp_doit/core/core.dart';
import 'package:flutter/material.dart';

class CustomFormValidation {
  static Color getColor(
    String? text,
    FocusNode focus,
    String? validationError,
  ) {
    if (focus.hasFocus && text == null) {
      return AppColors.red;
    } else if (focus.hasFocus &&
        text!.isEmpty &&
        validationError != null &&
        validationError.isNotEmpty) {
      return AppColors.red;
    } else if (focus.hasFocus &&
        text!.isNotEmpty &&
        validationError != null &&
        validationError.isEmpty) {
      return AppColors.red;
    } else if (text != null &&
        text.isNotEmpty &&
        validationError != null &&
        validationError.isEmpty) {
      return AppColors.primaryColor;
    } else if (validationError != null && validationError.isNotEmpty) {
      return AppColors.red;
    } else {
      return AppColors.inputBorderColor;
    }
  }

  static String errorMessagePasswordCreation(
    String? text,
    String message, [
    String? type,
  ]) {
    if (text == null) {
      return '';
    } else if (text.isEmpty) {
      return message;
    } else if (text.length <= 8) {
      return 'Password must have 8 or more characters';
    } else {
      return '';
    }
  }

  static String errorEmailMessage(
    String? text,
    String message, [
    String? type,
  ]) {
    if (text == null) {
      return '';
    } else if (text.isEmpty) {
      return message;
    } else if (EmailValidator.validEmail(text) == false) {
      return 'Email must be a valid email address';
    } else {
      return '';
    }
  }

  static String errorMessage(String? text, String message, [String? type]) {
    if (text == null) {
      return '';
    } else if (text.isEmpty) {
      return message;
    } else {
      return '';
    }
  }
}

class EmailValidator {
  static bool validEmail(String email) {
    return RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ).hasMatch(email);
  }
}
