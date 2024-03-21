import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:market_place/constants/category_list.dart';
import 'package:market_place/controller/auth_provider.dart';
import 'package:market_place/controller/firestore_provider.dart';
import 'package:market_place/model/product_model.dart';
import 'package:market_place/view/details_page/detials_page.dart';
import 'package:market_place/view/widget/category_container.dart';
import 'package:market_place/view/widget/custom_text_field.dart';
import 'package:market_place/view/widget/heading_text.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final pro = Provider.of<FirestoreProvider>(context, listen: false);
    pro.fetchCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

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
                          icon: const Icon(Icons.logout),
                        ),
                      ),
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
          SizedBox(
            height: screenHeight * 0.1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final categories = category[index];
                  return CategoryContainer(
                    name: categories.category!,
                    image: categories.imageUrl!,
                  );
                },
                itemCount: category.length,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          HeadingText(heading: "Recommentations"),
          Expanded(
            child: Consumer<FirestoreProvider>(
              builder: (context, value, child) => GridView.builder(
                itemCount: value.productList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index) {
                  final ProductModel product = value.productList[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DetailsPage(),
                        ),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey[100],
                        ),
                        child: Column(
                          children: [
                            Container(
                              color: Colors.black12,
                              child: Image.asset(""),
                            ),
                            Text(
                              product.name!,
                              style: const TextStyle(fontSize: 14),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 6, right: 6),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    product.price!,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const Icon(Icons.favorite_border_sharp),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
