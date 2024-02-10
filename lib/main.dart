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
import './cook_details.dart';
import './bookpage.dart';
import './noofppl.dart';
import './select_date.dart';
import '/select_time.dart';
import '/final_book.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey:
          "AIzaSyAdEZOyGP2dM2PAUa9-tJfXx3wT_g7vKas", // paste your api key here
      appId:
          "1:720390771822:android:96e564a015170bba6b827f", //paste your app id here
      messagingSenderId: "720390771822", //paste your messagingSenderId here
      projectId: "flutterlogin-f1e55", //paste your project id here"
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
        '/cookdetails': (context)=> CookDetailsPage(),
        '/bookpage' :(context)=> BookPage(),
        '/noofppl':(context)=> NoOfPpl(),
        '/date' :(context)=> SelectDate(),
        '/time' : (context) =>SelectTime(),
        '/final' :(context) =>FinalBook(),
      },
      // Start with the SplashScreen loader
    );
  }
}
