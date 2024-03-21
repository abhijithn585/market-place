import 'package:flutter/material.dart';
import 'package:market_place/controller/firestore_provider.dart';
import 'package:market_place/model/product_model.dart';
import 'package:provider/provider.dart';

class AddingPage extends StatefulWidget {
  const AddingPage({super.key});

  @override
  State<AddingPage> createState() => _AddingPageState();
}

class _AddingPageState extends State<AddingPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController detailsController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController imageController = TextEditingController();
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
              const Text("  Name"),
              const SizedBox(
                height: 5,
              ),
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    hintText: "Name",
                    hintStyle: const TextStyle(
                      color: Color(0xFF996E4D),
                    )),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text("  Details"),
              const SizedBox(
                height: 5,
              ),
              TextFormField(
                maxLines: 3,
                controller: detailsController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    hintText: "Details",
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
                controller: categoryController,
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
                height: 5,
              ),
              const Text("  Location"),
              const SizedBox(
                height: 5,
              ),
              TextFormField(
                controller: locationController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    hintText: "Location",
                    hintStyle: const TextStyle(
                      color: Color(0xFF996E4D),
                    )),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text("  image"),
              const SizedBox(
                height: 5,
              ),
              TextFormField(
                controller: imageController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    hintText: "Image",
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
                controller: priceController,
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
                child: ElevatedButton(
                    onPressed: () {
                      addProduct(context);
                    },
                    child: const Text("Done")),
              )
            ],
          ),
        ),
      ),
    );
  }

  addProduct(BuildContext context) {
    final pro = Provider.of<FirestoreProvider>(context, listen: false);
    final uid = pro.service.auth.currentUser!.uid;
    ProductModel product = ProductModel(
        name: nameController.text,
        price: priceController.text,
        category: categoryController.text,
        details: detailsController.text,
        imageUrl: imageController.text,
        location: locationController.text);
    pro.addProduct(product: product, name: nameController.text, uid: uid);
    Navigator.pop(context);
  }
}
