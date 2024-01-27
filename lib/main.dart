import 'package:flutter/material.dart';
import './splashscreen.dart';
import './register.dart';
import './login_page.dart';
import './home_page.dart';
import './rate_review.dart';
import './faq.dart';
import './about_us.dart';
import './find_cook.dart';
import './logout_page.dart';
import './profile_page.dart';

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
        '/home': (context) => HomePage(),
        '/home/rate': (context) => RateAndReviewPage(),
        '/home/faq': (context) => FAQPage(),
        '/home/about': (context) => AboutUsPage(),
        '/home/cook': (context) => FindACookPage(),
        '/home/logout': (context) => LogoutPage(),
        '/profile':(context)=>UserProfilePage(),
      },
      // Start with the SplashScreen
    );
  }
}
