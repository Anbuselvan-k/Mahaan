import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mathuram/home/social_media.dart';
import 'package:mathuram/login/Login_Screen.dart';
import 'package:mathuram/view%20plan/view_plan.dart';
import 'package:mathuram/welcome_screen/Splash_Screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home/bottom_nav.dart';
import 'home/branch.dart';
import 'home/home_screen.dart';
import 'home/scheme_screen.dart';
import 'login/ForgotPass.dart';
import 'login/SignUp_Screen.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isLoggedIn = false;
  bool _checkingLogin = true;

  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final loggedIn = prefs.getBool('isLoggedIn') ?? false;

    setState(() {
      _isLoggedIn = loggedIn;
      _checkingLogin = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_checkingLogin) {
      // Show splash/loading screen while checking login status
      return MaterialApp(
        home: Scaffold(
          body: Center(child: CircularProgressIndicator()),
        ),
      );
    }


    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: _isLoggedIn ? BottomNavigationScreen() : SplashScreen(),
    );
  }
}

