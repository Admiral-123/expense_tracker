import 'package:expense_tracker/login_signup_pages/login_page.dart';
import 'package:expense_tracker/login_signup_pages/signup_page.dart';
import 'package:expense_tracker/provider_backend/supabase_provider.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginSignupPages extends StatefulWidget {
  const LoginSignupPages({
    super.key,
    required this.isSignup,
    // required this.changePage,
  });
  final bool isSignup;
  // final Widget changePage;

  @override
  State<LoginSignupPages> createState() => _LoginSignupPagesState();
}

class _LoginSignupPagesState extends State<LoginSignupPages> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  SupabaseProvider _supabaseProvider = SupabaseProvider();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(
          widget.isSignup ? 'SignUp' : 'Login',
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            widget.isSignup
                ? Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextField(
                      controller: usernameController,
                      decoration: InputDecoration(
                        hintText: 'username, eg: Shinchan',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                    ),
                  )
                : Padding(padding: const EdgeInsets.all(0.5)),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: 'email, eg: abcd@xyz.com',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'password, eg: Hlo_234',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextButton(
                onPressed: () {
                  widget.isSignup
                      ? _supabaseProvider.signUpWithEmail(
                          usernameController.text.trim(),
                          emailController.text.trim(),
                          passwordController.text.trim(),
                        )
                      : (() {
                          try {
                            _supabaseProvider.loginWithEmail(
                              emailController.text.trim(),
                              passwordController.text.trim(),
                            );
                          } on AuthException catch (e) {
                            print('problem $e');
                          }
                        });
                },
                child: Text(widget.isSignup ? 'SignUp' : 'Login'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 35),
              child: widget.isSignup
                  ? GestureDetector(
                      child: Text(
                        'already have an account? login',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.blueAccent,
                        ),
                      ),
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      },
                    )
                  : GestureDetector(
                      child: Text(
                        'dont have an account? signup',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.blueAccent,
                        ),
                      ),
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => SignupPage()),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
