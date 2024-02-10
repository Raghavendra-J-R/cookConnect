// TODO Implement this library.
import 'package:flutter/material.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cuisine Preferences',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BookPage(),
    );
  }
}

class BookPage extends StatefulWidget {
  @override
  _CuisinePreferencePageState createState() => _CuisinePreferencePageState();
}

class _CuisinePreferencePageState extends State<BookPage> {
  final List<String> cuisines = ['North Indian', 'South Indian', 'Italian', 'Chinese', 'Mexican'];
  final Set<String> selectedCuisines = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Cuisines'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context), // Handle navigation
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Select multiple cuisines based on your preference',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cuisines.length,
              itemBuilder: (context, index) {
                final cuisine = cuisines[index];
                return ListTile(
                  title: Text(cuisine),
                  trailing: selectedCuisines.contains(cuisine)
                      ? Icon(Icons.check_circle, color: Colors.green)
                      : Icon(Icons.check_circle_outline),
                  onTap: () {
                    setState(() {
                      if (selectedCuisines.contains(cuisine)) {
                        selectedCuisines.remove(cuisine);
                      } else {
                        selectedCuisines.add(cuisine);
                      }
                    });
                  },
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(16.0),
            child: ElevatedButton(
              child: Text('Continue'),
              onPressed: selectedCuisines.isNotEmpty
                  ? () {
                // Handle continue action, like submitting the preferences
                Navigator.pushReplacementNamed(context, '/noofppl');
              } : null,
            ),
          )
        ],
      ),
    );
  }
}
