import 'package:flutter/material.dart';
import 'package:market_place/controller/auth_provider.dart';
import 'package:market_place/controller/firestore_provider.dart';
import 'package:market_place/view/listing_page/listing_page.dart';
import 'package:market_place/view/profile_editing/profile_editing_page.dart';
import 'package:market_place/view/sold_page/sold_page.dart';
import 'package:market_place/view/widget/custom_buttons.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
    Provider.of<FirestoreProvider>(context, listen: false).fetchCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<FirestoreProvider>(context, listen: true);
    final authpro = Provider.of<AuthProviders>(context, listen: true);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 55),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Consumer<FirestoreProvider>(
                    builder: (context, value, child) => Container(
                      width: 100,
                      height: 150,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: value.currentUser?.image != null
                                  ? NetworkImage(value.currentUser!.image!)
                                  : const AssetImage(
                                          "assets/images/profile.jpg")
                                      as ImageProvider,
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(15)),
                    ),
                  ),
                ),
              ],
            ),
            Text(
              pro.currentUser?.name ?? "Not Available",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButtons(
              text: 'Edit Profile',
              navigateToPage: ProfileEditingPage(
                currentUser: pro.currentUser,
              ),
            ),
            const CustomButtons(
              text: 'Listings',
              navigateToPage: ListingPage(),
            ),
            const CustomButtons(
              text: 'Sold Items',
              navigateToPage: SoldPage(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  authpro.signOut();
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Log Out',
                      style: TextStyle(fontSize: 17),
                    ),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.black54,
                    )
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
