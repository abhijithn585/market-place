import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:market_place/controller/firestore_provider.dart';
import 'package:market_place/controller/image_provider.dart';
import 'package:market_place/model/user_model.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class ProfileEditingPage extends StatefulWidget {
  ProfileEditingPage({required this.currentUser, super.key});
  UserModel? currentUser;
  @override
  State<ProfileEditingPage> createState() => _ProfileEditingPageState();
}

class _ProfileEditingPageState extends State<ProfileEditingPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController numberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Consumer<ImageProviders>(
            builder: (context, value, child) =>
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      value.selectImage(source: ImageSource.gallery);
                    },
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: value.selectedImage != null
                            ? DecorationImage(
                                image: FileImage(
                                  File(value.selectedImage!.path),
                                ),
                                fit: BoxFit.cover)
                            : null,
                      ),
                      child: value.selectedImage == null
                          ? LottieBuilder.asset(
                              "assets/lottie/Animation - 1710323208684.json",
                              fit: BoxFit.cover,
                            )
                          : null,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "  Name",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
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
                height: 20,
              ),
              const Text(
                "  Email",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 5,
              ),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    hintText: "Email",
                    hintStyle: const TextStyle(
                      color: Color(0xFF996E4D),
                    )),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "  Phone Number",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 5,
              ),
              TextFormField(
                controller: numberController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    hintText: "Phone Number",
                    hintStyle: const TextStyle(
                      color: Color(0xFF996E4D),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 90, top: 10),
                child: ElevatedButton(
                  onPressed: () {
                    updateUserInfo();
                    Navigator.pop(context);
                  },
                  style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all<Size>(
                        const Size.fromWidth(200)),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.red),
                  ),
                  child: const Text(
                    "Save",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }

  void updateUserInfo() async {
    final pro = Provider.of<FirestoreProvider>(context, listen: false);
    final imagepro = Provider.of<ImageProviders>(context, listen: false);
    await pro.addProfileImage(
        username: nameController.text,
        fileimage: File(imagepro.selectedImage!.path));

    pro.updateUserInfo(
        name: nameController.text,
        email: emailController.text,
        image: pro.service.downloadUrl!,
        number: numberController.text);
  }
}
