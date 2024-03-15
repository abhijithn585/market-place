import 'package:flutter/material.dart';

class AddingPage extends StatefulWidget {
  const AddingPage({super.key});

  @override
  State<AddingPage> createState() => _AddingPageState();
}

class _AddingPageState extends State<AddingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
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
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(20)),
                      child: const Icon(Icons.add),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(20)),
                      child: const Icon(Icons.add),
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
