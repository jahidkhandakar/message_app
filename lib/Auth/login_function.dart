import 'package:flutter/material.dart';
import 'package:get/get.dart';

void loginFunction({
  required TextEditingController emailController,
  required TextEditingController passwordController,
}) {
  String email = emailController.text.trim();
  String password = passwordController.text.trim();

  if (email.isEmpty || password.isEmpty) {
    Get.snackbar(
      'Error',
      'Please fill in all fields',
      snackPosition: SnackPosition.BOTTOM,
    );
    return;
  }

  // Here you would typically call your login API
  Get.snackbar(
    'Success',
    'Login successful',
    snackPosition: SnackPosition.BOTTOM,
  );
}

// Install Firebase CLI toolsnpm install -g firebase-tools
// Run the following command in your terminal or command prompt:
// npm install -g firebase-tools