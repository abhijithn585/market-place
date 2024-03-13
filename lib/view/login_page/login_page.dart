import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:market_place/controller/auth_provider.dart';
import 'package:market_place/view/login_page/phone_auth_page.dart';
import 'package:market_place/view/phone_authentication/phone_authentication.dart';
import 'package:market_place/view/register_page/register_page.dart';
import 'package:market_place/view/widget/bottom_nav_bar.dart';
import 'package:market_place/view/widget/custom_text_field.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

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
                hintText: "Enter your email",
                icons: Icons.email,
                controller: emailController,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                hintText: 'Enter your password',
                icons: Icons.key,
                controller: passwordController,
              ),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(
                onPressed: () {
                  signIn();
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(const Color(0xFF1E232C)),
                  fixedSize:
                      MaterialStateProperty.all<Size>(const Size(200, 60)),
                ),
                child: const Text(
                  "Login",
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
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PhoneAuthPage(),
                              ));
                        },
                        icon: const Icon(FontAwesomeIcons.phone)),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.grey[200]),
                    child: Consumer<AuthProviders>(
                      builder: (context, value, child) => IconButton(
                          onPressed: () {
                            value.signUpWithGoogle();
                          },
                          icon: const Icon(FontAwesomeIcons.google)),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.grey[200]),
                    child: Consumer<AuthProviders>(
                      builder: (context, value, child) => IconButton(
                          onPressed: () {
                            value.signUpWithGithub(context);
                          },
                          icon: const Icon(FontAwesomeIcons.github)),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don’t have an account?"),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RegisterPage(),
                          ));
                    },
                    child: const Text(
                      " Register Now",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void signIn() async {
    final signInservice = Provider.of<AuthProviders>(context, listen: false);
    String email = emailController.text;
    String password = passwordController.text;
    User? user = await signInservice.signInWithEmail(email, password, context);
    if (user != null) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const BottomNavBar(),
          ),
          (route) => false);
    } else {
      print("Can not signIN some error is there");
    }
  }
}
