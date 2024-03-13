import 'package:flutter/material.dart';
import 'package:market_place/constants/data_list.dart';
import 'package:market_place/controller/auth_provider.dart';
import 'package:market_place/controller/firestore_provider.dart';
import 'package:market_place/view/details_page/detials_page.dart';
import 'package:market_place/view/widget/category_container.dart';
import 'package:market_place/view/widget/custom_text_field.dart';
import 'package:market_place/view/widget/heading_text.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Provider.of<FirestoreProvider>(context, listen: false).fetchCurrentUser();
  }

  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: const BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Column(
                        children: [
                          Text(
                            'Location',
                            style: TextStyle(fontSize: 10),
                          ),
                          Text(
                            "Calicut",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      Consumer<AuthProviders>(
                          builder: (context, value, child) => IconButton(
                              onPressed: () {
                                value.signOut();
                              },
                              icon: const Icon(Icons.logout)))
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    icons: Icons.search,
                    hintText: "search..",
                    controller: searchController,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
          HeadingText(heading: "Category"),
          const SizedBox(
            height: 10,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  CategoryContainer(
                      name: "Car", image: "assets/images/car.png"),
                  const SizedBox(
                    width: 25,
                  ),
                  CategoryContainer(
                      name: "Property", image: "assets/images/house.png"),
                  const SizedBox(
                    width: 25,
                  ),
                  CategoryContainer(
                      name: "Mobile", image: "assets/images/phone.png"),
                  const SizedBox(
                    width: 25,
                  ),
                  CategoryContainer(
                      name: "Bike", image: "assets/images/bike.png"),
                  const SizedBox(
                    width: 25,
                  ),
                  CategoryContainer(
                      name: "furniture", image: "assets/images/furniture.png"),
                  const SizedBox(
                    width: 25,
                  ),
                  CategoryContainer(
                      name: "Laptop", image: "assets/images/laptop.png")
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          HeadingText(heading: "Recommentations"),
          Expanded(
            child: GridView.builder(
              itemCount: products.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemBuilder: (context, index) {
                final datas = products[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DetailsPage(),
                        )),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey[100],
                      ),
                      child: Column(
                        children: [
                          Image.asset(
                            datas.image!,
                          ),
                          Text(
                            datas.name!,
                            style: const TextStyle(fontSize: 14),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 6, right: 6),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  datas.price!,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                const Icon(Icons.favorite_border_sharp)
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
    );
  }
}
