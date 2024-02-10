import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cook Booking App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: FinalBook(),
    );
  }
}

class FinalBook extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center( // Wrap the Column with Center
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // Top status bar

            SizedBox(height: 20.0),
            // Cook Booked icon and text
            Icon(
              Icons.restaurant_menu,
              size: 100,
              color: Colors.orange,
            ),
            SizedBox(height: 10.0),
            Text(
              'Cook Booked',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.0),
            // Booking confirmation message
            Text(
              'Your cook has been successfully booked.',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(height: 40.0),
            // Continue button
            ElevatedButton(
              onPressed: () {
                // Add navigation logic here
                Navigator.pushReplacementNamed(context, '/home');
              },
              child: Text('Continue'),
            ),
          ],
        ),
      ),
    );
  }
}
