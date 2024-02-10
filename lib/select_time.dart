import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SelectTime(),
    );
  }
}

class SelectTime extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<SelectTime> {
  String selectedTime = 'Select Time';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your preferred timing'),
      ),
      body: Column(
        children: <Widget>[
          ListTile(
            title: Text('Breakfast'),
            trailing: DropdownButton<String>(
              value: selectedTime,
              onChanged: (String? newValue) {
                setState(() {
                  selectedTime = newValue!;
                });
              },
              items: <String>['Select Time', '7:00 AM', '7:30 AM', '8:00 AM']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          ListTile(
            title: Text('Dinner'),
            trailing: DropdownButton<String>(
              value: selectedTime,
              onChanged: (String? newValue) {
                setState(() {
                  selectedTime = newValue!;
                });
              },
              items: <String>['Select Time', '7:00 PM', '7:30 PM', '8:00 PM']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Daily Visit\n1 Hour',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
      floatingActionButton: Container(
        width: double.infinity, // Set width to 100%
        padding: EdgeInsets.symmetric(horizontal: 16.0), // Add horizontal padding
        child: ElevatedButton(
          onPressed: () {
            // Handle button press
            Navigator.pushReplacementNamed(context, '/date');
          },
          child: Text('Continue'),
          style: ElevatedButton.styleFrom(
            primary: Colors.orange, // Set button color to orange
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat, // Align button at the bottom center
    );
  }
}
