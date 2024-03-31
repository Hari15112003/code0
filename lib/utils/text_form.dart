import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final IconData? iconData;
  final TextEditingController controller;
  final String hintText;
  final String labelText;
  final bool? readyOnly;

  const CustomTextField(
      {super.key,
      this.readyOnly,
      required this.iconData,
      required this.hintText,
      required this.controller,
      required this.labelText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      readOnly: readyOnly ?? false,
      keyboardType:
          labelText == "Otp" ? TextInputType.number : TextInputType.text,
      decoration: InputDecoration(
        // floatingLabelStyle:
        //     MaterialStateTextStyle.resolveWith((states) => null),
        labelStyle: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black.withOpacity(0.7)),
        alignLabelWithHint: true,
        border: const OutlineInputBorder(
          gapPadding: 3,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        floatingLabelAlignment: FloatingLabelAlignment.start,
        enabled: true,
        labelText: labelText,
        hintText: hintText,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        suffixIcon: Icon(
          iconData,
          size: 20,
        ),
      ),
    );
  }
}
