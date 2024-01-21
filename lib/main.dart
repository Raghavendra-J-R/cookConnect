import 'package:flutter/material.dart';
import './splashscreen.dart';
import './register.dart';
import './login_page.dart';
import './home_page.dart';
import './rate_review.dart';

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
        '/rate' : (context)=> RateAndReviewPage(),
      },
      // Start with the SplashScreen
    );
  }
}
