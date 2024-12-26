import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget{
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>{
  @override
  Widget build(BuildContext context){
    
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(70),
          color: Colors.blue,
          child: Column (
            mainAxisSize: MainAxisSize.min, // Shrinks to fit its children
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
                'Welcome to Appointed'
                ),
              const SizedBox(
                width: 20,
                height: 20,
              ),
              Form(
                child: Column (
                  children: [
                    SizedBox(
                      width: 350,
                      child: TextFormField(
                        decoration: const InputDecoration(
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