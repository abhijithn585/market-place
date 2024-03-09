import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:market_place/controller/auth_provider.dart';
import 'package:market_place/view/widget/custom_text_field.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 60, left: 20, right: 20),
          child: Column(
            children: [
              Text(
                'Welcome back! Glad to see you, Again!',
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold, fontSize: 25),
              ),
              const SizedBox(
                height: 40,
              ),
              CustomTextField(
                icons: Icons.person,
                hintText: 'Username',
                controller: userNameController,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                hintText: 'Email',
                icons: Icons.email,
                controller: emailController,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                hintText: 'Password',
                icons: Icons.lock,
                controller: passwordController,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                hintText: 'Confirm password',
                icons: Icons.lock,
                controller: confirmPasswordController,
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(const Color(0xFF1E232C)),
                  fixedSize:
                      MaterialStateProperty.all<Size>(const Size(200, 60)),
                ),
                child: const Text(
                  "Agree and Register",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Or Login with",
                style: TextStyle(color: Colors.black45),
              ),
              const Divider(),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.grey[200]),
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(FontAwesomeIcons.phone)),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.grey[200]),
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(FontAwesomeIcons.google)),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.grey[200]),
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(FontAwesomeIcons.github)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void signUp() async {
    final signUpservice = Provider.of<AuthProviders>(context, listen: false);
    String name = userNameController.text;
    String email = emailController.text;
    String password = passwordController.text;
    String confirmPassword = confirmPasswordController.text;
    User? user = await signUpservice.signUpWithEmail(email, password, name);
  }
}
