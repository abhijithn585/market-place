import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:market_place/controller/firestore_provider.dart';
import 'package:market_place/controller/image_provider.dart';
import 'package:market_place/model/product_model.dart';
import 'package:market_place/view/widget/bottom_nav_bar.dart';
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
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
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
                child: Consumer<ImageProviders>(
                  builder: (context, value, child) => Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          value.selectImage(source: ImageSource.camera);
                        },
                        child: Container(
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: value.selectedImage != null
                                      ? FileImage(
                                          File(value.selectedImage!.path))
                                      : AssetImage("assets/images/add.png")
                                          as ImageProvider),
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(20)),
                          child: const Icon(Icons.add),
                        ),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 130, top: 20),
                child: GestureDetector(
                  onTap: () {
                    if (areAllFieldFilled()) {
                      addProduct(context);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text("Please fill in all fields")),
                      );
                    }
                  },
                  child: Container(
                    width: screenWidth * 0.25,
                    height: screenHeight * 0.05,
                    decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Text(
                        'Done',
                        style: GoogleFonts.urbanist(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  addProduct(BuildContext context) async {
    final pro = Provider.of<FirestoreProvider>(context, listen: false);
    final pros = Provider.of<ImageProviders>(context, listen: false);
    final uid = pro.service.auth.currentUser!.uid;
    await pro.addProductImage(
        productname: nameController.text,
        fileimage: File(pros.selectedImage!.path));
    ProductModel product = ProductModel(
        name: nameController.text,
        price: priceController.text,
        category: categoryController.text,
        details: detailsController.text,
        imageUrl: pro.service.downloadUrl,
        location: locationController.text);
    pro.addProduct(product: product, name: nameController.text, uid: uid);
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => BottomNavBar(),
        ));
  }

  bool areAllFieldFilled() {
    return nameController.text.isNotEmpty &&
        priceController.text.isNotEmpty &&
        categoryController.text.isNotEmpty &&
        detailsController.text.isNotEmpty;
  }
}
