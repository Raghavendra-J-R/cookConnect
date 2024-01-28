// cook_details.dart
import 'package:flutter/material.dart';

import 'find_cook.dart';

class CookDetailsPage extends StatelessWidget {
  final Cook cook;

  CookDetailsPage({required this.cook});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cook Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage(cook.imagePath),
            ),
            const SizedBox(height: 20),
            Text('Name: ${cook.name}', style: TextStyle(fontSize: 20)),
            const SizedBox(height: 10),
            Text('Specialty: ${cook.specialty}', style: TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Text('Type: ${cook.isVeg ? 'Vegetarian' : 'Non-Vegetarian'}', style: TextStyle(fontSize: 18)),
            const SizedBox(height: 20),
            // Add more details as needed
          ],
        ),
      ),
    );
  }
}
