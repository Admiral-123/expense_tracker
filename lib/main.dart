import 'package:expense_tracker/custom_widgets/login_signup_pages.dart';
import 'package:expense_tracker/login_signup_pages/login_page.dart';
import 'package:expense_tracker/pages/lent.dart';
import 'package:expense_tracker/pages/owed.dart';
import 'package:expense_tracker/pages/spending.dart';
import 'package:expense_tracker/provider_backend/supabase_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');

  Supabase.initialize(
    anonKey: dotenv.get('anon_key'),
    url: dotenv.get('project_url'),
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SupabaseProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expanse Tracker',
      color: Colors.amber,
      debugShowCheckedModeBanner: false,
      home: SplashScr(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {
  int _currentIndex = 0;
  final List<Widget> _pages = [const Spending(), const Lent(), const Owed()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.money_outlined),
            label: 'spending',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet),
            label: 'Lent',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_outlined),
            label: 'Owed',
          ),
        ],
      ),
    );
  }
}

class SplashScr extends StatefulWidget {
  const SplashScr({super.key});

  @override
  State<SplashScr> createState() => _SplashScrState();
}

class _SplashScrState extends State<SplashScr> {
  @override
  initState() {
    super.initState();
    switchScr();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/logo.png'),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: const CircularProgressIndicator(),
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> switchScr() async {
    await Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(
          builder: (context) => StreamBuilder(
            stream: context.read<SupabaseProvider>().onAuthState(),
            builder: (context, snapshot) {
              var session = snapshot.hasData ? snapshot.data!.session : null;

              if (session != null) {
                return Home();
              } else {
                return LoginPage();
              }
            },
          ),
        ),
      );
    });
  }
}
