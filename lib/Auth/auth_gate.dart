import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:message_app/Auth/login_or_register.dart';
import 'package:message_app/pages/home_page.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(), 
        builder: (context, snapshot){
          //if user is logged in, show home page
          if(snapshot.hasData){
            return const HomePage();
          }else{
            return const LoginOrRegister();
          }
        }
      ),
    );
  }
}