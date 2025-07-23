import 'package:flutter/material.dart';

class Spending extends StatefulWidget {
  const Spending({super.key});

  @override
  State<Spending> createState() => SpendingState();
}

class SpendingState extends State<Spending> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Spending'),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Center(child: Text('Spending')),
    );
  }
}
