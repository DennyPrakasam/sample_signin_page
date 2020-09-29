import 'package:flutter/material.dart';
import 'package:sign_up/login.dart';
import 'package:sign_up/signup.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login UI',
      //home: SignIn(),
      routes: {
        '/': (context) => SignIn(),
        '/SignUp': (context) => SignUp(),
      },
    );
  }
}
