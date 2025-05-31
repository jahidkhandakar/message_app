import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:message_app/Auth/login_or_register.dart';
import 'package:message_app/pages/home_page.dart';
import 'package:message_app/Auth/auth_controller.dart'; // Use the correct path

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (AuthController.to.isLoggedIn) {
          return const HomePage();
        } else {
          return const LoginOrRegister();
        }
      }),
    );
  }
}
