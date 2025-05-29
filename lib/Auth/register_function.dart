import 'package:get/get.dart';
import 'package:flutter/material.dart';

void registerFunction({
  required TextEditingController emailController,
  required TextEditingController passwordController,
  required TextEditingController confirmPasswordController,
  required TextEditingController nameController,
}) {
  String email = emailController.text.trim();
  String password = passwordController.text.trim();
  String confirmPassword = confirmPasswordController.text.trim();
  String name = nameController.text.trim();

  if (email.isEmpty ||
      password.isEmpty ||
      confirmPassword.isEmpty ||
      name.isEmpty) {
    Get.snackbar(
      'Error',
      'Please fill in all fields',
      snackPosition: SnackPosition.BOTTOM,
    );
    return;
  }

  if (password != confirmPassword) {
    Get.snackbar(
      'Error',
      'Passwords do not match',
      snackPosition: SnackPosition.BOTTOM,
    );
    return;
  }

  // Here you would typically call your registration API
  Get.snackbar(
    'Success',
    'Registration successful',
    snackPosition: SnackPosition.BOTTOM,
  );
}
