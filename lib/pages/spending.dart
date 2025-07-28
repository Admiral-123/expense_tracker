import 'package:expense_tracker/provider_backend/supabase_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Spending extends StatefulWidget {
  const Spending({super.key});

  @override
  State<Spending> createState() => SpendingState();
}

class SpendingState extends State<Spending> {
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();

  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Spending'),
        backgroundColor: Colors.orangeAccent,
      ),
      body: FutureBuilder(
        future: context.read<SupabaseProvider>().getUsername(),
        builder: (context, snapshot) {
          var data = snapshot.data!;

          return Center(child: Text(data));
        },
      ),
    );
  }
}
