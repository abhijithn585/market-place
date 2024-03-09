import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:market_place/view/favoraits_page/favoraits_page.dart';
import 'package:market_place/view/listing_page/listing_page.dart';
import 'package:market_place/view/profile_editing/profile_editing_page.dart';
import 'package:market_place/view/sold_page/sold_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 55),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 200,
                  width: 170,
                  child: CircleAvatar(
                    backgroundImage: AssetImage("images/profile.jpg"),
                  ),
                ),
              ],
            ),
            Text(
              "David",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfileEditingPage(),
                    ));
              },
              child: Text(
                "     Edit Profile      ",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ListingPage(),
                    ));
              },
              child: Container(
                height: 70,
                width: 300,
                decoration: BoxDecoration(
                    color: Color.fromARGB(244, 224, 224, 224),
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [Icon(Icons.label), Text("1 Listing")],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SoldPage(),
                    ));
              },
              child: Container(
                height: 70,
                width: 300,
                decoration: BoxDecoration(
                    color: Color.fromARGB(244, 224, 224, 224),
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(Icons.shopping_bag),
                      Text(
                        "1 Sold",
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SoldPage(),
                    ));
              },
              child: Container(
                height: 70,
                width: 100,
                decoration: BoxDecoration(
                    color: Color.fromARGB(244, 224, 224, 224),
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(Icons.logout),
                      Text(
                        "Log Out",
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
