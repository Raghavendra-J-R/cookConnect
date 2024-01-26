import 'package:flutter/material.dart';
import 'package:bookcook/splashscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import './register.dart';
import './login_page.dart';
import './home_page.dart';
import './rate_review.dart';
import './faq.dart';
import './about_us.dart';
import './find_cook.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey:
          "AIzaSyA23_hEHbDwCJpRIM7ZoG05HEoC3vcWRbo", // paste your api key here
      appId:
          "1:708912598125:android:9f5fc09e4a0bd152390364", //paste your app id here
      messagingSenderId: "764674678447", //paste your messagingSenderId here
      projectId: "cookconnect-5fa1c", //paste your project id here"
    ),
  );

  runApp(const MyApp());
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
      },
      // Start with the SplashScreen
    );
  }
}
