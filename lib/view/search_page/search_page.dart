import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:market_place/controller/firestore_provider.dart';
import 'package:market_place/model/product_model.dart';
import 'package:market_place/view/details_page/detials_page.dart';

import 'package:provider/provider.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 30,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Search',
                        style: GoogleFonts.urbanist(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(25, 20, 25, 20),
                  child: Consumer<FirestoreProvider>(
                    builder: (context, pro, child) => TextFormField(
                      onChanged: (value) {
                        pro.searchProducts(value);
                      },
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.search),
                          prefixIconColor: Colors.white.withOpacity(0.5),
                          hintText: 'Search',
                          hintStyle:
                              TextStyle(color: Colors.white.withOpacity(0.5)),
                          filled: true,
                          fillColor: Colors.red,
                          border: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)))),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Consumer<FirestoreProvider>(
            builder: (context, value, child) => SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final ProductModel product = value.productList[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsPage(product: product),
                        ),
                      ),
                      child: Container(
                        width: size.width / 2,
                        height: size.height * 0.4,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: size.width * 0.55,
                                height: size.height * 0.15,
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade100,
                                    borderRadius:
                                        const BorderRadius.all(Radius.circular(10))),
                                child: Hero(
                                  tag: product.name!,
                                  child: Image.network(product.imageUrl!),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                                child: Text(
                                  product.name!,
                                  style: GoogleFonts.urbanist(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "₹ ${product.price}",
                                style: GoogleFonts.urbanist(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                childCount: value.productList.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
