import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SoldPage extends StatefulWidget {
  const SoldPage({super.key});

  @override
  State<SoldPage> createState() => _SoldPageState();
}

class _SoldPageState extends State<SoldPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.only(left: 14),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 180,
                  width: 180,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(171, 224, 224, 224),
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        "images/bmw rr.webp",
                        fit: BoxFit.cover,
                      ),
                      Text(
                        "BMW RR1000 2023 model",
                        style: TextStyle(fontSize: 13),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "\$5000",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "SOLD",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Container(
                  height: 180,
                  width: 180,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(171, 224, 224, 224),
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        "images/navy-blue-sport-sedan-road-side-view.jpg",
                        fit: BoxFit.cover,
                      ),
                      Text(
                        "MackBook Air 2023 model",
                        style: TextStyle(fontSize: 13),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "\$5000",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "SOLD",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
