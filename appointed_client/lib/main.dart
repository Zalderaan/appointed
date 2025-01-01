// other imports
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:appointed_client/routes.dart';

// firebase deps imports
import 'package:firebase_core/firebase_core.dart';

// screens imports
import 'package:appointed_client/screens/login/login_screen.dart';

// auth bloc imports
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:appointed_client/blocs/auth/auth_bloc.dart';
import 'package:appointed_client/services/auth_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  String apiKey = dotenv.env['FIREBASE_API_KEY'] ?? (throw Exception('FIREBASE_API_KEY not found in .env'));
  String appId = dotenv.env['FIREBASE_APP_ID'] ?? (throw Exception('FIREBASE_APP_ID not found in .env'));
  String messagingSenderId = dotenv.env['FIREBASE_MESSAGING_SENDER_ID'] ?? (throw Exception('FIREBASE_MESSAGING_SENDER_ID not found in .env'));
  String projectId = dotenv.env['FIREBASE_PROJECT_ID'] ?? (throw Exception('FIREBASE_PROJECT_ID not found in .env'));

  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: apiKey,
      appId: appId, 
      messagingSenderId: messagingSenderId,
      projectId: projectId,
    )
  );
  runApp(const AppointedApp());
}

class AppointedApp extends StatelessWidget {
  const AppointedApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(authService: AuthService()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/login',
        routes: AppRoutes.getRoutes(),
      ) 
    );
  }
}
