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
}
