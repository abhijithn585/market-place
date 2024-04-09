import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:market_place/controller/auth_provider.dart';
import 'package:market_place/controller/firestore_provider.dart';
import 'package:market_place/controller/image_provider.dart';
import 'package:market_place/model/product_model.dart';
import 'package:market_place/view/details_page/detials_page.dart';
import 'package:market_place/view/search_page/search_page.dart';
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
    final pro = Provider.of<FirestoreProvider>(context, listen: false);
    pro.fetchCurrentUser();
    pro.fetchProducts();
    pro.fetchAllCategory();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.grey[200],
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
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SearchPage(),
                          ));
                    },
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.search,
                              color: Colors.black45,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Search",
                              style: TextStyle(color: Colors.black45),
                            ),
                          ],
                        ),
                      ),
                    ),
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
            height: screenHeight * 0.08,
            child: Consumer<FirestoreProvider>(
              builder: (context, value, child) => ListView.builder(
                itemCount: value.categoryList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final String category = value.categoryList[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        value.fetchProductsByCategory(category: category);
                        value.selectedCategory = category;
                      },
                      child: Container(
                        width: screenWidth * 0.25,
                        height: screenHeight * 0.05,
                        decoration: BoxDecoration(
                          border: value.selectedCategory == category
                              ? Border.all(color: Colors.black)
                              : Border.all(color: Colors.transparent),
                          color: const Color.fromARGB(255, 255, 2, 2),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(
                          child: Text(
                            category,
                            style: GoogleFonts.urbanist(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
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
                          builder: (context) => DetailsPage(product: product,),
                        ),
                      ),
                      child: Consumer<ImageProviders>(
                        builder: (context, value, child) => Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Container(
                                  color: Colors.black12,
                                  child: Image.network(
                                    product.imageUrl ?? "",
                                    height: 120,
                                  ),
                                ),
                                Text(
                                  product.name!,
                                  style: const TextStyle(fontSize: 14),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 6, right: 6),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "₹${product.price}",
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
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
