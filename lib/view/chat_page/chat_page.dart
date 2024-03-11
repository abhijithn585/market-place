import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 35),
          child: Column(
            children: [
              const TabBar(tabs: [
                Tab(
                  text: 'All',
                ),
                Tab(
                  text: 'Buy',
                ),
                Tab(
                  text: 'Sell',
                ),
              ]),
              Expanded(
                child: TabBarView(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            children: [
                              Image.asset(
                                "images/BMW_M3_Competition_(G80)_IMG_4041.jpg",
                                height: 80,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Jassim"),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text('BMW M3 petrol,2023 mmodel')
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            children: [
                              Image.asset(
                                "images/BMW_M3_Competition_(G80)_IMG_4041.jpg",
                                height: 80,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Jassim"),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text('BMW M3 petrol,2023 mmodel')
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                  Image.asset(
                    "images/seo_1055645.png",
                    height: 200,
                  ),
                  const Text("You have no message so far")
                                      ],
                                    ),
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
