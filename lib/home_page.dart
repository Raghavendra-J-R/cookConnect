import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _handleMenuIconPressed() {
    _scaffoldKey.currentState?.openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CookConnect'),
        // Adding a Drawer button
      ),
      // Drawer widget
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.amber,
              ),
              child: Text(
                'CookConnect',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context, '/home');
              },
            ),
            ListTile(
              title: const Text('Find a Cook'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/home/cook');
              },
            ),
            ListTile(
              title: const Text('Ratings and Reviews'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/home/rate');
              },
            ),
            ListTile(
              title: const Text('FAQ'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/home/faq');
              },
            ),
            ListTile(
              title: const Text('About Us'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/home/about');
              },
            ),
            ListTile(
              title: const Text('Log Out'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/home/logout');
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          CarouselSlider(
            items: [
              Image.asset('assets/pic1.jpg'),
              Image.asset('assets/pic2.jpg'),
              Image.asset('assets/pic3.jpg'),
            ],
            options: CarouselOptions(
              height: 200,
              autoPlay: true,
              enlargeCenterPage: true,
            ),
          ),
          const SizedBox(height: 20),
          const ListTile(
            title: Text(
              'Special Offers and Discounts',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            subtitle: Text('Check out our latest offers and discounts!'),
          ),
          CategorySelectionWidget(),
          const SizedBox(height: 20),
          CookDetailsWidget(
            cookName: 'John Doe',
            specialty: 'Italian Cuisine',
            availability: 'Available Now',
            profileImagePath: 'assets/veg.jpg',
            category: 'Veg',
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Navigate to the "Find a Cook" screen or perform the desired action
              // For now, print a message to the console
              Navigator.pushReplacementNamed(context, '/home/cook');
              print('Find a Cook button pressed!');
            },
            child: const Text('Find a Cook'),
          ),
        ],
      ),
    );
  }
}

class CategorySelectionWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CategoryItemWidget('Veg', 'assets/veg.jpg'),
          const SizedBox(width: 20),
          CategoryItemWidget('Non-Veg', 'assets/nonveg.jpg'),
        ],
      ),
    );
  }
}

class CategoryItemWidget extends StatelessWidget {
  final String categoryName;
  final String iconImagePath;

  CategoryItemWidget(this.categoryName, this.iconImagePath);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 50,
          backgroundImage: AssetImage(iconImagePath),
        ),
        const SizedBox(height: 5),
        Text(categoryName),
      ],
    );
  }
}

class CookDetailsWidget extends StatelessWidget {
  final String cookName;
  final String specialty;
  final String availability;
  final String profileImagePath;
  final String category;

  CookDetailsWidget({
    required this.cookName,
    required this.specialty,
    required this.availability,
    required this.profileImagePath,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    String cookDetails =
        "Cook: $cookName\nSpecialty: $specialty\nAvailability: $availability";

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage(profileImagePath),
          ),
          const SizedBox(height: 10),
          Text(
            category,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(
            cookDetails,
            style: const TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
