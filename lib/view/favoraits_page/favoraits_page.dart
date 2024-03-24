import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:market_place/controller/firestore_provider.dart';
import 'package:market_place/view/favoraits_page/widgets/widgets.dart';
import 'package:provider/provider.dart';

class FavoraitsPage extends StatefulWidget {
  const FavoraitsPage({super.key});

  @override
  State<FavoraitsPage> createState() => _FavoraitsPageState();
}

class _FavoraitsPageState extends State<FavoraitsPage> {
  @override
  void initState() {
    super.initState();
    Provider.of<FirestoreProvider>(context, listen: false).fetchFavoritItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 70, left: 14),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Fav ',
                    style: GoogleFonts.poppins(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                  ),
                  Text(
                    "orite",
                    style: GoogleFonts.poppins(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: WishlistItems(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
