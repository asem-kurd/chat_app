import 'package:chat_app/screens/sign_in_screen.dart';
import 'package:chat_app/screens/register_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ChatApp());
}

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        'LoginScreen': (context) => const LoginScreen(),
        RegisterScreen.id: (context) => RegisterScreen(),
      },
      initialRoute: "LoginScreen",
    );
  }
}
