import 'package:flutter/material.dart';

class FavoraitsPage extends StatefulWidget {
  const FavoraitsPage({super.key});

  @override
  State<FavoraitsPage> createState() => _FavoraitsPageState();
}

class _FavoraitsPageState extends State<FavoraitsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 70, left: 14),
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
                      const Text(
                        "BMW RR1000 2023 model",
                        style: TextStyle(fontSize: 13),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "\$5000",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Icon(Icons.favorite)
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
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
                      const Text(
                        "MackBook Air 2023 model",
                        style: TextStyle(fontSize: 13),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "\$5000",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Icon(Icons.favorite)
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
