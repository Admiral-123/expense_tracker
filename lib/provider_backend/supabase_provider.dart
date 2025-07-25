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
    try {
      await Supabase.instance.client.auth.signUp(
        email: email,
        password: password,
        data: {'displayName': username},
      );
      // await Supabase.instance.client.auth.
    } catch (e) {
      print('problem is $e');
    }
    notifyListeners();
  }

  Future<void> loginWithEmail(String email, String password) async {
    try {
      await Supabase.instance.client.auth.signInWithPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }
}
