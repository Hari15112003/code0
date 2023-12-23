import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback function;
  const CustomButton({
    super.key,
    required this.text,
    required this.function,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: Colors.blue),
          borderRadius: BorderRadius.circular(10),
        ),
        minimumSize: const Size(300, 50),
        backgroundColor: text == "Login" || text == "Register"
            ? const Color.fromARGB(255, 68, 33, 243).withOpacity(0.9)
            : Colors.white,
      ),
      onPressed: function,
      child: Text(
        text,
        style: TextStyle(
            color: text == "Login" || text == "Register"
                ? Colors.white
                : Colors.black,
            fontSize: 18),
      ),
    );
  }
}
