import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:market_place/controller/firestore_provider.dart';
import 'package:market_place/model/product_model.dart';
import 'package:provider/provider.dart';

class ListingContainer extends StatefulWidget {
  const ListingContainer({super.key});

  @override
  State<ListingContainer> createState() => _ListingContainerState();
}

class _ListingContainerState extends State<ListingContainer> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<FirestoreProvider>(context, listen: false).fetchUserProduct();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Consumer<FirestoreProvider>(builder: (context, value, child) {
      if (value.userProductList.isNotEmpty) {
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: value.userProductList.length,
          itemBuilder: (context, index) {
            final ProductModel product = value.userProductList[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: size.width,
                height: size.height * 0.18,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 10),
                      child: Container(
                          width: size.width * 0.3,
                          height: size.height * 0.15,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(15)),
                          child: Image.network(product.imageUrl!)),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              product.name!,
                              maxLines: 2,
                              style: GoogleFonts.urbanist(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              "₹ ${product.price}",
                              style: GoogleFonts.poppins(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    // value.deleteFavorits(
                                    //     productname: product.name!);
                                  },
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ))
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      } else {
        return Center(
          child: LottieBuilder.asset(
              "assets/lottie/Animation - 1709009620778.json"),
        );
      }
    });
  }
}
