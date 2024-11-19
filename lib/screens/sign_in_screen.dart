import 'package:chat_app/constants.dart';
import 'package:chat_app/screens/register_screen.dart';
import 'package:chat_app/widgets/custom_btn.dart';
import 'package:chat_app/widgets/custom_txt_field.dart';
import 'package:chat_app/widgets/show_snack_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  String? email, password;
  bool isLoading = false;
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 100, left: 20, right: 20),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/imgs/logo.png",
                      width: 250,
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
                CustomTxtField.CustomFormTxtField(
                  hintTxt: 'Email',
                  onChanged: (data) {
                    email = data;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTxtField.CustomFormTxtField(
                  hintTxt: 'Password',
                  onChanged: (data) {
                    password = data;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomBtn(
                  btnName: "Sign in",
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      isLoading = true;
                      setState(() {});
                      try {
                        await userSignIn();
                        showSnackBar(context, "Sign In Sucsess");
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'user-not-found') {
                          showSnackBar(
                            context,
                            "You are not found in this email, you should register",
                          );
                        } else if (e.code == 'wrong-password') {
                          showSnackBar(
                              context, "this password is wrong");
                        }
                      } catch (e) {
                        print("Asem there is an error here ===> $e");
                        showSnackBar(context, "Check DEBUG CONSOLE");
                      }
                      isLoading = false;
                      setState(() {});
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("You don't have an account?"),
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
        ),
      ),
    );
  }

  Future<void> userSignIn() async {
    UserCredential user =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  }
}
