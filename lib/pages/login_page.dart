import 'package:flutter/material.dart';
import 'package:message_app/widgets/my_button.dart';
import 'package:message_app/widgets/my_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

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
              obscureText: false),
            const SizedBox(height: 10),
            //*password input field_____________________________
              MyTextField(
              controller: passwordController, 
              hintText: 'Password', 
              obscureText: true),
            const SizedBox(height: 25),
            //*signin-login button______________________________
            MyButton(
              onTap: (){}, 
              text: 'Sign In'),
            //*not a member? register here______________________
            ],

          ),
        ),
      ),
    );
  }
}
