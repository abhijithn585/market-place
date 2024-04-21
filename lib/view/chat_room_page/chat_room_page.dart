import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:market_place/controller/chat_image_provider.dart';
import 'package:market_place/controller/firestore_provider.dart';
import 'package:market_place/model/product_model.dart';
import 'package:market_place/service/auth_service.dart';
import 'package:market_place/service/chat_service.dart';
import 'package:market_place/view/chat_room_page/widget/chat_bubble.dart';
import 'package:market_place/view/chat_room_page/widget/image_selector_dialog.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class ChatRoomPage extends StatefulWidget {
  final ProductModel productModel;
  const ChatRoomPage({super.key, required this.productModel});
  @override
  State<ChatRoomPage> createState() => _ChatPageRoomState();
}

class _ChatPageRoomState extends State<ChatRoomPage> {
  TextEditingController messagecontroller = TextEditingController();

  AuthService service = AuthService();
  @override
  void initState() {
    super.initState();
    final currentUserid = service.firebaseAuth.currentUser!.uid;
    Provider.of<FirestoreProvider>(context, listen: false)
        .getMessages(currentUserid, widget.productModel.sellerUid!);
    print('UserIds 1 ${currentUserid} 2 ${widget.productModel.sellerUid}');
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Chat',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
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
          Expanded(
              child: Stack(
            children: [
              Container(
                // messages container
                width: size.width,
                decoration: const BoxDecoration(
                    color: Color.fromRGBO(239, 237, 247, 1),
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(35))),
                child: Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: ChatBubble(service: service, size: size),
                ),
              ),
              Positioned(
                  bottom: 10,
                  left: 5,
                  right: 5,
                  child: Container(
                    width: size.width * 0.9,
                    height: size.height * 0.08,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  final pro =
                                      Provider.of<ChatImageProviders>(context);
                                  return ImageSelectorDialog(
                                      pro: pro,
                                      size: size,
                                      recieverId:
                                          widget.productModel.sellerUid!);
                                },
                              );
                            },
                            icon: const Icon(Icons.add)),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              style: GoogleFonts.poppins(
                                  color: Colors.black, fontSize: 18),
                              controller: messagecontroller,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(20)),
                                  filled: true,
                                  fillColor:
                                      const Color.fromRGBO(239, 237, 247, 1)),
                            ),
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              sendMessage();
                            },
                            icon: const Icon(
                              Icons.send_rounded,
                              color: (Color(0xFF688a74)),
                              size: 30,
                            ))
                      ],
                    ),
                  ))
            ],
          )),
        ],
      ),
    );
  }

  sendMessage() async {
    if (messagecontroller.text.isNotEmpty) {
      await ChatService().sendMessage(
          widget.productModel.sellerUid!, messagecontroller.text, 'text');
      messagecontroller.clear();
    }
  }
}
