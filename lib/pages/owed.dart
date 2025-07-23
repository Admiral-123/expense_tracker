import 'package:flutter/material.dart';

class Owed extends StatefulWidget {
  const Owed({super.key});

  @override
  State<Owed> createState() => OwedState();
}

class OwedState extends State<Owed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Owed'), backgroundColor: Colors.redAccent),
      body: Center(child: Text('to Owed')),
    );
  }
}
