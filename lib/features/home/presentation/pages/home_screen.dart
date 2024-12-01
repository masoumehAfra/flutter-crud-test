import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "You have successfully registered !!!",
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
        ),
      ),
    );
  }
}
