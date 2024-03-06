import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:market_place/constants/data_list.dart';
import 'package:market_place/view/detials_page.dart';
import 'package:market_place/view/widget/category_container.dart';
import 'package:market_place/view/widget/custom_text_field.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 60, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      'Location',
                      style: TextStyle(fontSize: 10),
                    ),
                    Container(
                      child: Text(
                        "Calicut",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
                Icon(Icons.person)
              ],
            ),
            SizedBox(
              height: 10,
            ),
            CustomTextField(icons: Icons.search, hintText: "search.."),
            SizedBox(
              height: 10,
            ),
            Text('Category'),
            SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  CategoryContainer(name: "Car", image: "images/car.png"),
                  SizedBox(
                    width: 25,
                  ),
                  CategoryContainer(
                      name: "Property", image: "images/house.png"),
                  SizedBox(
                    width: 25,
                  ),
                  CategoryContainer(name: "Mobile", image: "images/phone.png"),
                  SizedBox(
                    width: 25,
                  ),
                  CategoryContainer(name: "Bike", image: "images/bike.png"),
                  SizedBox(
                    width: 25,
                  ),
                  CategoryContainer(
                      name: "furniture", image: "images/furniture.png"),
                  SizedBox(
                    width: 25,
                  ),
                  CategoryContainer(name: "Laptop", image: "images/laptop.png")
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text("Recommentations"),
            Expanded(
              child: GridView.builder(
                itemCount: products.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  final datas = products[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsPage(),
                          )),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey[100],
                        ),
                        child: Column(
                          children: [
                            Image.asset(datas.image!),
                            Text(
                              datas.name!,
                              style: TextStyle(fontSize: 14),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 6, right: 6),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    datas.price!,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Icon(Icons.favorite_border_sharp)
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
