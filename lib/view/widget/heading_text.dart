import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HeadingText extends StatelessWidget {
  HeadingText({required this.heading, super.key});
  String heading;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        heading,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
