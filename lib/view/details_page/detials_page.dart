import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:market_place/controller/firestore_provider.dart';
import 'package:market_place/model/product_model.dart';
import 'package:market_place/view/chat_room_page/chat_room_page.dart';
import 'package:market_place/view/details_page/widgets/details_row.dart';
import 'package:market_place/view/widget/custom_back_button.dart';
import 'package:provider/provider.dart';

class DetailsPage extends StatelessWidget {
  DetailsPage({super.key, required this.product});
  ProductModel product;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Column(
          children: [
            SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomBackButton(
                      bottom: 30,
                      left: 30,
                      right: 30,
                      top: 30,
                      size: size,
                      color: Colors.white,
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                      )),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 30, 30, 30),
                    child: GestureDetector(
                      onTap: () {
                        Provider.of<FirestoreProvider>(context, listen: false)
                            .addToFavoraits(
                                product: product, productname: product.name!);
                      },
                      child: Container(
                        width: size.width * 0.13,
                        height: size.height * 0.06,
                        decoration: const BoxDecoration(
                            color: Colors.white, shape: BoxShape.circle),
                        child: Center(
                            child: SizedBox(
                                width: size.width * 0.1,
                                child:
                                    Image.asset('assets/icons/favorite.png'))),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Center(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(product.imageUrl!)),
            )),
            const SizedBox(
              height: 20,
            ),
            Container(
              constraints: BoxConstraints(
                minHeight: size.height * 0.5,
              ),
              width: size.width,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(40))),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        product.name!,
                        style: GoogleFonts.urbanist(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    DetailsRow(
                      size: size,
                      head1: "Category",
                      head2: "Price",
                      value1: product.category!,
                      width: size.width * 0.18,
                      value2: product.price!,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Container(
                        width: size.width,
                        height: size.height * 0.15,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(111, 189, 189, 189),
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                          children: [
                            Text(
                              "Description",
                              style: GoogleFonts.urbanist(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  product.details!,
                                  style: GoogleFonts.urbanist(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black.withOpacity(0.7),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 20, 0, 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            height: size.height * 0.05,
                            width: size.width * 0.5,
                            child: ElevatedButton(
                              style: const ButtonStyle(
                                  backgroundColor:
                                      MaterialStatePropertyAll(Colors.red)),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => ChatRoomPage(
                                    productModel: product,
                                  ),
                                ));
                              },
                              child: Text(
                                "Chat with Seller",
                                style: GoogleFonts.poppins(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
