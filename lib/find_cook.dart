// TODO Implement this library.
import 'package:flutter/material.dart';
import 'cook_details.dart';
class FindACookPage extends StatefulWidget {
  @override
  _FindACookPageState createState() => _FindACookPageState();
}

class _FindACookPageState extends State<FindACookPage> {
  TextEditingController _searchController = TextEditingController();
  List<String> suggestions = [];
  String selectedFilter = 'Both';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Find a Cook'),
        backgroundColor: Colors.amber,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Navigate back to the home page
            Navigator.pushReplacementNamed(context, '/home');
          },
        ),
        actions: [
          // Filter dropdown
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButton<String>(
              value: selectedFilter,
              onChanged: (String? newValue) {
                setState(() {
                  selectedFilter = newValue!;
                });
              },
              items: ['Veg', 'Non-Veg', 'Both'].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Search Bar with Auto-Suggest
            TextField(
              controller: _searchController,
              onChanged: (value) {
                setState(() {
                  suggestions = availableCooks
                      .where((cook) =>
                          cook.name.toLowerCase().contains(value.toLowerCase()))
                      .map((cook) => cook.name)
                      .toList();
                });
              },
              decoration: const InputDecoration(
                hintText: 'Search for a cook...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            // Auto-Suggestions
            if (suggestions.isNotEmpty)
              SizedBox(
                height: 100,
                child: ListView.builder(
                  itemCount: suggestions.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(suggestions[index]),
                    );
                  },
                ),
              ),

            // List of Available Cooks
            Expanded(
              child: ListView.builder(
                itemCount: availableCooks.length,
                itemBuilder: (context, index) {
                  if ((selectedFilter == 'Veg' && availableCooks[index].isVeg) ||
                      (selectedFilter == 'Non-Veg' && !availableCooks[index].isVeg) ||
                      selectedFilter == 'Both') {
                    return CookCard(cook: availableCooks[index]);
                  } else {
                    return SizedBox.shrink(); // Hide the cook card if it doesn't match the filter
                  }
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
      elevation: 6,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        leading: const CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage('assets/prof3.jpg'),
        ),
        title: Text(cook.name),
        subtitle: Text(cook.specialty),
        trailing: ElevatedButton(
          onPressed: () {
            // Navigate to CookDetailsPage
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CookDetailsPage(cook: cook)),
            );
          },
          child: Text('Book'),
        ),
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
  final bool isVeg;

  Cook({
    required this.name,
    required this.specialty,
    required this.imagePath,
    required this.isVeg,
  });
}

List<Cook> availableCooks = [
  Cook(
      name: 'Cook Pratham',
      specialty: 'North Karnataka',
      imagePath: 'assets/prof1.jpg',
      isVeg: true),
  Cook(
      name: 'Cook Rathan',
      specialty: 'Karavalli style',
      imagePath: 'assets/prof2.jpg',
      isVeg: false),
  Cook(
      name: 'Cook Balaji',
      specialty: 'South Indian',
      imagePath: 'assets/prof3.jpg',
      isVeg: false),
  // Add more cooks as needed
];
