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

  SupabaseStreamBuilder spendStream() {
    return Supabase.instance.client
        .from('spending')
        .stream(primaryKey: ['id'])
        .order('created_at', ascending: false);
  }

  Future<String> lastThirtyDaySpending() async {
    final supabase = Supabase.instance.client;

    // Calculate date 30 days ago
    final thirtyDaysAgo = DateTime.now().subtract(const Duration(days: 30));

    // Query with sum aggregation
    final response = await supabase
        .from('your_table') // table name only!
        .select('sum(spending_hours)')
        .gte('created_at', thirtyDaysAgo.toIso8601String())
        .single(); // ensures only one row is returned

    return response['sum'] ?? 'no spending yet';
  }
}
