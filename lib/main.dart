import 'package:flutter/material.dart';
import 'package:login_ui/view/login/login.dart';
import 'package:login_ui/view/registration/registration.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Login(email: '',password: '',),
      ),
    );
  }
}
