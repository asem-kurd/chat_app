import 'package:chat_app/constants.dart';
import 'package:chat_app/widgets/custom_btn.dart';
import 'package:chat_app/widgets/custom_txt_field.dart';
import 'package:chat_app/widgets/show_snack_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

// ignore: must_be_immutable
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});
  static String id = "RegisterScreen";
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // static it refers for this screen
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
                      "Register",
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
                  btnName: "Register",
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      isLoading = true;
                      setState(() {});
                      try {
                        await userRegister();
                        showSnackBar(context, "Registeration Sucsess bitch");
                      } on FirebaseAuthException catch (e) {
                        if (e.code == "weak-password") {
                          showSnackBar(
                              context, "Bitch your password is to weak");
                        } else if (e.code == 'email-already-in-use') {
                          showSnackBar(
                              context, "Fuck you this email is exists");
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
                    const Text("Already have an account?"),
                    const SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        "Sign In",
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

  Future<void> userRegister() async {
    UserCredential user =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  }
}
