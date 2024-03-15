import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:market_place/controller/auth_provider.dart';
import 'package:market_place/view/widget/bottom_nav_bar.dart';
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
  void dispose() {
    userNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                onPressed: () {
                  signUpWithEmail(context);
                },
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
              Padding(
                padding: const EdgeInsets.only(top: 5, left: 70),
                child: Row(
                  children: [
                    const Text("You Alrready have account "),
                    GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: const Text(
                          "Login",
                          style: TextStyle(color: Colors.blue),
                        ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  signUpWithEmail(BuildContext context) {
    final signUpService = Provider.of<AuthProviders>(context, listen: false);
    if (passwordController.text == confirmPasswordController.text) {
      signUpService.signUpWithEmail(emailController.text,
          passwordController.text, userNameController.text);
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const BottomNavBar(),
          ));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Password Don't Match")));
    }
  }
}
