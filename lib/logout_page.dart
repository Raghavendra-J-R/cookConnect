// TODO Implement this library.
import 'package:flutter/material.dart';

class LogoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Logout'),
      ),
      body:Center(

       child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Are you sure you want to logout?',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement logout functionality
                // For now, print a message to the console
                print('User logged out!');
                // Navigate back to the login or home page
                Navigator.pop(context); // Close the logout page
                // You can also use Navigator.pushReplacementNamed to navigate to the login page
              },
              child: Text('Logout'),
            ),
          ],
        ),
       ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: LogoutPage(),
  ));
}
