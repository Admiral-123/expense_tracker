import 'package:flutter/material.dart';

class Lent extends StatefulWidget {
  const Lent({super.key});
  @override
  State<Lent> createState() => LentState();
}

class LentState extends State<Lent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lent'), backgroundColor: Colors.greenAccent),
      body: Center(child: Text('Lent')),
    );
  }
}
