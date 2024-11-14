import 'package:flutter/material.dart';

class CustomBtn extends StatelessWidget {
  const CustomBtn({super.key, required this.btnName});
  final String btnName;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xff244927),
        borderRadius: BorderRadius.circular(10),
      ),
      width: double.infinity,
      height: 50,
      child:
          Center(child: Text(btnName, style: const TextStyle(color: Colors.white))),
    );
  }
}
