import 'package:flutter/material.dart';
import './splashscreen.dart';
import './register.dart';
import './login_page.dart';
import './home_page2.dart';
import './home_page1.dart';

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
        '/home2' : (context)=> HomePage2(),
        '/home1': (context)=> HomePage(),
      },
      // Start with the SplashScreen
    );
  }
}
