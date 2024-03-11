import 'package:flutter/material.dart';

class CustomButtons extends StatelessWidget {
  const CustomButtons({required this.text,required this.navigateToPage, super.key});
  final String text;
  final Widget navigateToPage;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => navigateToPage,
              ));
        },
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  text,
                  style: TextStyle(fontSize: 17),
                ),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.black54,
                )
              ],
            ),
            SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }
}
