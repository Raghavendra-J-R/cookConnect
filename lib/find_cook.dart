// TODO Implement this library.
import 'package:flutter/material.dart';

class FindACookPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Find a Cook'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Search Bar
            TextField(
              decoration: InputDecoration(
                hintText: 'Search for a cook...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),

            // List of Available Cooks
            Expanded(
              child: ListView.builder(
                itemCount: availableCooks.length,
                itemBuilder: (context, index) {
                  return CookCard(cook: availableCooks[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CookCard extends StatelessWidget {
  final Cook cook;

  CookCard({required this.cook});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage(cook.imagePath),
        ),
        title: Text(cook.name),
        subtitle: Text(cook.specialty),
        onTap: () {
          // TODO: Navigate to the cook's details page or perform the desired action
          // For now, print a message to the console
          print('Cook selected: ${cook.name}');
        },
      ),
    );
  }
}

class Cook {
  final String name;
  final String specialty;
  final String imagePath;

  Cook({required this.name, required this.specialty, required this.imagePath});
}

List<Cook> availableCooks = [
  Cook(name: 'Chef John', specialty: 'Italian Cuisine', imagePath: 'assets/chef1.jpg'),
  Cook(name: 'Chef Emily', specialty: 'Japanese Sushi', imagePath: 'assets/chef2.jpg'),
  Cook(name: 'Chef Alex', specialty: 'Mexican Tacos', imagePath: 'assets/chef3.jpg'),
  // Add more cooks as needed
];

void main() {
  runApp(MaterialApp(
    home: FindACookPage(),
  ));
}
