import 'package:flutter/material.dart';


class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Homescreen',
      style: TextStyle(fontSize: 30,
      fontWeight: FontWeight.bold),)),
    );
  }
}