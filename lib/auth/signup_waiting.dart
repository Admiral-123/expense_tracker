import 'package:flutter/material.dart';

class SignupWaiting extends StatefulWidget {
  const SignupWaiting({super.key, required this.email});

  final String email;

  @override
  State<SignupWaiting> createState() => _SignupWaitingState();
}

class _SignupWaitingState extends State<SignupWaiting> {
  @override
  Widget build(BuildContext context) {
    final userEmail = widget.email;
    return Scaffold(
      body: Center(child: Text('a link is sent to the email \n $userEmail')),
    );
  }
}
