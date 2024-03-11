import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CategoryContainer extends StatelessWidget {
  CategoryContainer({required this.name, required this.image, super.key});
  String image;
  String name;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 45,
          child: Image.asset(image),
        ),
        Text(name)
      ],
    );
  }
}
