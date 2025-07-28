import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseProvider extends ChangeNotifier {
  Stream<AuthState> onAuthState() {
    return Supabase.instance.client.auth.onAuthStateChange;
  }

  Future<void> signUpWithEmail(
    String username,
    String email,
    String password,
  ) async {
    await Supabase.instance.client.auth.signUp(
      email: email,
      password: password,
      emailRedirectTo: "expensetracker://login-callback",
      data: {'displayName': username},
    );

    notifyListeners();
  }

  Future<dynamic> loginWithEmail(String email, String password) async {
    await Supabase.instance.client.auth.signInWithPassword(
      email: email,
      password: password,
    );

    notifyListeners();
  }

  Future<String> getUsername() async {
    return Supabase.instance.client.auth.currentUser!.email!;
  }
}
