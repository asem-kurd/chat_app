import 'package:flutter/material.dart';

class CustomTxtField extends StatelessWidget {
  const CustomTxtField({super.key, required this.hintTxt});
  final String hintTxt;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintTxt,
        /* placeholder */
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xff244927),
          ),
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
