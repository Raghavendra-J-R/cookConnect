import 'package:flutter/material.dart';
import './splashscreen.dart';
import './register.dart';
import './login_page.dart';
import './home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => SplashScreen(),
        '/register': (context) => RegistrationPage(),
        '/login': (context) => LoginPage(),
        '/home': (context)=> HomePage(),
      },
      // Start with the SplashScreen
    );
  }
}
