import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:market_place/controller/auth_provider.dart';
import 'package:market_place/controller/firestore_provider.dart';
import 'package:market_place/firebase_options.dart';
import 'package:market_place/view/auth_gate.dart';
import 'package:provider/provider.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProviders(),
        ),
        ChangeNotifierProvider(create: (context) => FirestoreProvider(),)
      ],
      child: const MaterialApp(
          debugShowCheckedModeBanner: false, home: AuthGate()),
    );
  }
}
