import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:appointed_client/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyAEIjeRBjRhv7EJ72JEh8njjn3BnpF_UHc",
      appId: "1:524926291571:web:184f0699cc391f8b1c6406", 
      messagingSenderId: "524926291571",
      projectId: "appointed-dc4fa",
    )
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Appointed',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/login',
      routes: AppRoutes.getRoutes(),
    );
  }
}
