import 'package:expense_tracker/custom_widgets/my_progress_circle.dart';
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
      body: StreamBuilder(
        stream: context.read<SupabaseProvider>().spendStream(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: MyProgressCircle(msgText: 'please wait'));
          }
          if (!snapshot.hasData) {
            return Center(child: Text('No Spending yet :|'));
          }
          if (snapshot.hasError) {
            return Center(child: Text('Something went wrong :('));
          }

          final data = snapshot.data!;

          return ListView.builder(itemBuilder: (context, index) {});
        },
      ),
    );
  }
}
