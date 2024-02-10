import 'package:bookcook/bookpage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CookDetailsPage(),
    );
  }
}

class CookDetailsPage extends StatelessWidget {
  // Method to show the alert message
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
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/home/cook');
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20),
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/chef1.jpg'),
            ),
            SizedBox(height: 10),
            Text(
              'Ankit Yadav',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.star, color: Colors.orange),
                Text('4.8/5'),
              ],
            ),
            SizedBox(height: 5),
            Text(
              '6+ Years Experience',
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 5),
            Text(
              '123-456-7890',
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Container(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildGalleryItem('assets/dish1.jpg', 'North Indian in the Family', '22 JUNE 1:00 PM'),
                  _buildGalleryItem('assets/dish2.jpg', 'Caption 2', 'Date 2'),
                  _buildGalleryItem('assets/dish3.jpg', 'Caption 3', 'Date 3'),
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Review Statistics', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Icon(Icons.arrow_forward),
                ],
              ),
            ),
            SizedBox(height: 10),
            _buildReviewStatistics(),
            SizedBox(height: 20),
            // Submit button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButton(
                onPressed: () {
                  _showSubmitAlert(context); // Show alert message
                },
                child: Text('Book'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGalleryItem(String imagePath, String caption, String date) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              imagePath,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 5),
          Text(caption),
          Text(date),
        ],
      ),
    );
  }

  Widget _buildReviewStatistics() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text('5', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              Icon(Icons.star, color: Colors.orange),
            ],
          ),
          SizedBox(height: 10),
          _buildRatingBar(5, 70),
          _buildRatingBar(4, 30),
          _buildRatingBar(3, 0),
          _buildRatingBar(2, 0),
          _buildRatingBar(1, 0),
        ],
      ),
    );
  }

  Widget _buildRatingBar(int stars, int percentage) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text('$stars stars: $percentage%'),
        SizedBox(width: 10),
        Expanded(
          child: Container(
            height: 10,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(5),
            ),
            // Fill the bar dynamically based on the percentage
            child: FractionallySizedBox(
              widthFactor: percentage / 100,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
