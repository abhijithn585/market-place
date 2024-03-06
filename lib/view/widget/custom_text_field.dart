import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({required this.icons, required this.hintText, super.key});
  final String hintText;
  final IconData icons;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(20),
          ),
          prefixIcon: Icon(icons),
          hintText: hintText,
          fillColor: const Color(0xFFF7F8F9),
          filled: true,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 20)),
    );
  }
}
