import 'package:flutter/material.dart';

class MyProgressCircle extends StatefulWidget {
  const MyProgressCircle({super.key, required this.msgText});

  final String msgText;

  @override
  State<MyProgressCircle> createState() => _PorgressCircleState();
}

class _PorgressCircleState extends State<MyProgressCircle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 251, 240, 240),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            children: [
              CircularProgressIndicator(color: Colors.blueAccent),
              Text(widget.msgText),
            ],
          ),
        ),
      ),
    );
  }
}
