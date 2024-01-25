import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LogoutPage extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Logout'),
        backgroundColor: Colors.amber,
      ),
      body: Center(
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
                onPressed: () async {
                  try {
                    await _auth.signOut();
                    // If logout is successful, print a message to the console
                    print('User logged out!');
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Succesfully Logged out')));
                    // Navigate back to the login page
                    Navigator.pushReplacementNamed(context, '/login');
                  } catch (e) {
                    // Handle logout error (show error message, etc.)
                    print('Error during logout: $e');
                  }
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
