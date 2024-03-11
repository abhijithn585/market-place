import 'package:flutter/material.dart';
import 'package:market_place/view/chat_room_page/chat_room_page.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.favorite_border),
          )
        ],
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset("images/bmw rr.webp"),
              const SizedBox(
                height: 5,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "BMW 1000RR 2023 ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 5),
                child: Text("\$500000"),
              ),
              const SizedBox(
                height: 13,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 5),
                child: Text(
                  "Condition",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 5),
                child: Text("Used- Good"),
              ),
              const SizedBox(
                height: 13,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 5),
                child: Text(
                  "Description",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 5),
                child: Text(
                    "I have been using this bike few days jndna  jawndjna jndnKJND OWJDJWDOJ endoiwnjwjndoqwnd wnwdoqwndoqn qwndoqwndowkkm nsjwi sjsn am wuro "),
              ),
              const SizedBox(
                height: 13,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 5),
                child: Text(
                  "Specifications",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ChatRoomPage(),
                  ));
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                  const Color.fromARGB(255, 132, 132, 132)),
            ),
            child: const Text(
              "Chat With Seller",
              style: TextStyle(color: Colors.black),
            ),
          )
        ],
      ),
    );
  }
}
