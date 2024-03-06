import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:market_place/view/widget/custom_text_field.dart';

class AddingPage extends StatefulWidget {
  const AddingPage({super.key});

  @override
  State<AddingPage> createState() => _AddingPageState();
}

class _AddingPageState extends State<AddingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("  Title"),
              const SizedBox(
                height: 5,
              ),
              TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    hintText: "Title",
                    hintStyle: const TextStyle(
                      color: Color(0xFF996E4D),
                    )),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text("  Description"),
              const SizedBox(
                height: 5,
              ),
              TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    hintText: "Description",
                    hintStyle: const TextStyle(
                      color: Color(0xFF996E4D),
                    )),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text("  Category"),
              const SizedBox(
                height: 5,
              ),
              TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    hintText: "Category",
                    hintStyle: const TextStyle(
                      color: Color(0xFF996E4D),
                    )),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text("  Price"),
              const SizedBox(
                height: 5,
              ),
              TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    hintText: "Price",
                    hintStyle: const TextStyle(
                      color: Color(0xFF996E4D),
                    )),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "  Photos",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Container(
                      child: const Icon(Icons.add),
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Container(
                      child: const Icon(Icons.add),
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(20)),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 130, top: 20),
                child:
                    ElevatedButton(onPressed: () {}, child: const Text("Done")),
              )
            ],
          ),
        ),
      ),
    );
  }
}
