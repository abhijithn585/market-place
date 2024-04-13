import 'package:flutter/material.dart';
import 'package:market_place/controller/firestore_provider.dart';
import 'package:market_place/model/product_model.dart';
import 'package:market_place/service/auth_service.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class ChatRoomPage extends StatefulWidget {
  final ProductModel productModel;
  const ChatRoomPage({super.key, required this.productModel});
  @override
  State<ChatRoomPage> createState() => _ChatPageRoomState();
}

class _ChatPageRoomState extends State<ChatRoomPage> {
  AuthService service = AuthService();
  @override
  void initState() {
    super.initState();
    final currentUserid = service.firebaseAuth.currentUser!.uid;
    Provider.of<FirestoreProvider>(context, listen: false)
        .getMessages(currentUserid, widget.productModel.sellerUid!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Chat',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 100,
                        width: 100,
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(
                              '${widget.productModel.sellerImage}'),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${widget.productModel.sellerName}",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: SizedBox(
                  width: 330,
                  child: TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        prefixIcon: IconButton(
                            onPressed: () {}, icon: const Icon(Icons.add)),
                        hintText: "Type here..",
                        fillColor: const Color.fromARGB(255, 236, 236, 236),
                        filled: true,
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20)),
                  ),
                ),
              ),
              IconButton(onPressed: () {}, icon: const Icon(Icons.send))
            ],
          )
        ],
      ),
    );
  }
}
