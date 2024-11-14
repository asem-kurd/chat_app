import 'package:chat_app/constants.dart';
import 'package:chat_app/screens/register_screen.dart';
import 'package:chat_app/widgets/custom_btn.dart';
import 'package:chat_app/widgets/custom_txt_field.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 100, left: 20, right: 20),
        child: ListView(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "JO chat",
                  style: TextStyle(fontSize: 32, color: kPrimaryColor),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            const Row(
              children: [
                Text(
                  "Sign In",
                  style: TextStyle(fontSize: 24, color: kPrimaryColor),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            /* This is New for me */
            const CustomTxtField(
              hintTxt: 'Email',
            ),
            const SizedBox(
              height: 20,
            ),
            const CustomTxtField(
              hintTxt: 'Password',
            ),
            const SizedBox(
              height: 20,
            ),
            const CustomBtn(btnName: "Sign In"),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an account?"),
                const SizedBox(
                  width: 5,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed((context), RegisterScreen.id);
                  },
                  child: const Text(
                    "Register",
                    style: TextStyle(
                      color: kPrimaryColor,
                    ),
                  ),
                )
              ],
            ),
            const Spacer(
              flex: 5,
            ),
          ],
        ),
      ),
    );
  }
}
