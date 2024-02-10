// TODO Implement this library.
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meal Plan Page',
      home: NoOfPpl(),
    );
  }
}

class NoOfPpl extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        title: Text('Number of people for meal will be prepared:'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 10.0), // Adds space between the app bar and the first button.
            // First row of buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(child: MealButton(label: '1-2')),
                SizedBox(width: 10.0), // Space between buttons
                Expanded(child: MealButton(label: '3-4')),
                SizedBox(width: 10.0), // Space between buttons
                Expanded(child: MealButton(label: '5-6')),
              ],
            ),
            SizedBox(height: 20.0), // Adds vertical space between the rows.
            // Second row of buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(child: MealButton(label: 'Breakfast')),
                SizedBox(width: 10.0),
                Expanded(child: MealButton(label: 'Lunch')),
                SizedBox(width: 10.0),
                Expanded(child: MealButton(label: 'Dinner')),
              ],
            ),
            SizedBox(height: 20.0),
            // The total number of visits
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(child: NumberCard(label: 'Total number of visits', number: '1')),
                SizedBox(width: 10.0),
                Expanded(child: NumberCard(label: '2')),
                SizedBox(width: 10.0),
                Expanded(child: NumberCard(label: '3')),
              ],
            ),
            SizedBox(height: 20.0),
            // Pricing card
            Card(
              color: Colors.orangeAccent,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('₹1200', style: TextStyle(fontSize: 24.0)),
                    Icon(Icons.shopping_cart),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(),
            ), // This container is used to push the bottom 'Continue' button to the screen's bottom.
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.orange,
              ),
              child: Text('Continue'),
              onPressed: () {
                // Handle continue press
                Navigator.pushReplacementNamed(context, '/time');
              },
            ),
          ],
        ),
      ),
    );
  }
}

class MealButton extends StatelessWidget {
  final String label;

  MealButton({required this.label});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
        backgroundColor: Colors.orange,
        ),
      onPressed: () {
        // Handle button press
      }, child: null,
    );
  }
}

class NumberCard extends StatelessWidget {
  final String label;
  final String? number;

  NumberCard({required this.label, this.number});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.orangeAccent,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (number != null) Text(number!, style: TextStyle(fontSize: 24.0)),
            Text(label),
          ],
        ),
      ),
    );
  }
}
