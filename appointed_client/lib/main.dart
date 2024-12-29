import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:appointed_client/routes.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  String apiKey = dotenv.env['apiKey'] ?? '';
  String appId = dotenv.env['appId'] ?? '';
  String messagingSenderId = dotenv.env['messagingSenderId'] ?? '';
  String projectId = dotenv.env['projectId'] ?? '';

  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: apiKey,
      appId: appId, 
      messagingSenderId: messagingSenderId,
      projectId: projectId,
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
