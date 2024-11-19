import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTxtField extends StatelessWidget {
  CustomTxtField.CustomFormTxtField(
      {super.key, required this.hintTxt, required this.onChanged});
  final String? hintTxt;
  Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (data) {
        if (data!.isEmpty) {
          return "Fill this feild bitch";
        }
        return null;
      },
      onChanged: onChanged,
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
