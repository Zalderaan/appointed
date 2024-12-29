import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget{
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>{
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context){
    
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(70),
          color: const Color.fromARGB(255, 194, 206, 216),
          child: Column (
            mainAxisSize: MainAxisSize.min, // Shrinks to fit its children
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 30,
                ),
                'Welcome to Appointed'
                ),
              const SizedBox(
                width: 20,
                height: 20,
              ),
              Form(
                key: _loginFormKey,
                child: Column (
                  children: [
                    SizedBox(
                      width: 350,
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          labelText: 'Email',
                        ),
                      ),
                    ),
          
                    const SizedBox(
                      width: 20,
                      height: 20,
                    ),
                    
                    SizedBox(
                      width: 350,
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                        )
                      ),
                    ),

                    const SizedBox(
                      width: 20,
                      height: 20,
                    ),

                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/home');
                      }, 
                      child: const Text('Login'),
                    )
                  ],
                )
              )
            ],
          ),
        ),
      )
    );
  }
}