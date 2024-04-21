import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:market_place/controller/firestore_provider.dart';
import 'package:market_place/view/listing_page/widgets/listing_container.dart';
import 'package:market_place/view/widget/custom_back_button.dart';
import 'package:provider/provider.dart';

class ListingPage extends StatefulWidget {
  const ListingPage({super.key});

  @override
  State<ListingPage> createState() => _ListingPageState();
}

class _ListingPageState extends State<ListingPage> {
  @override
  void initState() {
    super.initState();
    Provider.of<FirestoreProvider>(context, listen: false).fetchUserProduct();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 70, left: 14),
          child: Column(
            children: [
              Row(
                children: [
                  CustomBackButton(
                      bottom: 30,
                      left: 10,
                      right: 30,
                      top: 30,
                      size: size,
                      color: Colors.white,
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Your ',
                        style: GoogleFonts.poppins(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.red),
                      ),
                      Text(
                        "Products",
                        style: GoogleFonts.poppins(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: ListingContainer(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
