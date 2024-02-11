import 'package:flutter/material.dart';
import 'find_cook.dart';
import 'bookpage.dart';

class CookDetailsPage extends StatelessWidget {
  final Cook cook;

  CookDetailsPage({required this.cook});
  void _showSubmitAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Confirmation"),
          content: Text("Are you sure you want to book?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                // Handle submit action
                Navigator.of(context).pop(); // Close the dialog
                // Navigate to another page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BookPage()),
                );
              },
              child: Text("Book"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cook Details'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20),
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage(cook.imagePath),
            ),
            SizedBox(height: 10),
            Text(
              cook.name,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 5),
            Text(
              'Specialty: ${cook.specialty}',
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 5),
            Text(
              'Dietary Preference: ${cook.isVeg ? 'Vegetarian' : 'Non-Vegetarian'}',
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _showSubmitAlert(context); // Show alert message
              },
              child: Text('Book'),
            ),
          ],
        ),
      ),
    );
  }
}
