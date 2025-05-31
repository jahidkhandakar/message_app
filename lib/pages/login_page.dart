import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:message_app/widgets/my_button.dart';
import 'package:message_app/widgets/my_text_field.dart';

import '../Auth/auth_controller.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;

  const LoginPage({super.key, this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: const Text('iMessage', style: TextStyle(fontSize: 30)),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //*logo_____________________________________________
              const SizedBox(height: 50),
              Icon(Icons.message, size: 80, color: Colors.grey),
              const SizedBox(height: 20),
              //*welcome back message_____________________________
              const Text(
                'Welcome back, you\'ve been missed!',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 25),
              //*email input field________________________________
              MyTextField(
                controller: emailController,
                hintText: 'Email',
                obscureText: false,
              ),
              const SizedBox(height: 10),
              //*password input field_____________________________
              MyTextField(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,
              ),
              const SizedBox(height: 25),
              //*signin-login button______________________________
              Obx(
                () => MyButton(
                  onTap:
                      AuthController.to.isLoading.value
                          ? null
                          : () {
                            AuthController.to.signIn(
                              emailController.text,
                              passwordController.text,
                            );
                          },
                  text:
                      AuthController.to.isLoading.value
                          ? 'Loading...'
                          : 'Log In',
                ),
              ),
              //*error message if any
              Obx(
                () =>
                    AuthController.to.errorMessage.value.isNotEmpty
                        ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            AuthController.to.errorMessage.value,
                            style: const TextStyle(color: Colors.red),
                          ),
                        )
                        : const SizedBox.shrink(),
              ),
              //*not a member? register here______________________
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Not a member?',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(width: 4),
                  InkWell(
                    onTap: widget.onTap,
                    //*when tapped, it will toggle to the register page
                    child: Text(
                      'Register here',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
