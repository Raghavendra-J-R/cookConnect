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
        backgroundColor: Colors.orangeAccent,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20),
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 160,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.orangeAccent,
                    image: DecorationImage(
                      image: AssetImage(cook.imagePath),
                      fit: BoxFit.cover,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 10,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                ),
                Text(
                  cook.name,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Specialty: ${cook.specialty}',
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Dietary Preference: ${cook.isVeg ? 'Vegetarian' : 'Non-Vegetarian'}',
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Phone Number: ${cook.phoneNumber}',
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {
                      _showSubmitAlert(context); // Show alert message
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.orangeAccent,
                      padding: EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      'Book',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
