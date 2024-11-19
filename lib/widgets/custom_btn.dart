// ignore_for_file: must_be_immutable

import 'package:chat_app/constants.dart';
import 'package:flutter/material.dart';

class CustomBtn extends StatelessWidget {
  CustomBtn({super.key, required this.btnName, required this.onTap});
  final String btnName;
  VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        width: double.infinity,
        height: 50,
        child: Center(
            child: Text(btnName, style: const TextStyle(color: Colors.white))),
      ),
    );
  }
}
