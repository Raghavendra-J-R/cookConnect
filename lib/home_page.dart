import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CookConnect'),
        // Adding a Drawer button
        actions: [
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              // Open the Drawer when the menu icon is pressed
              Scaffold.of(context).openDrawer();
            },
          ),
        ],
      ),
      // Drawer widget
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
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
              title: Text('Home'),
              onTap: () {
                // Navigate to the Home page
                Navigator.pop(context); // Close the Drawer
                // You can add further navigation logic here
              },
            ),
            ListTile(
              title: Text('Find a Cook'),
              onTap: () {
                // Navigate to the Find a Cook page or screen
                Navigator.pushReplacementNamed(context,'/cook'); // Close the Drawer
                // You can add further navigation logic here
              },
            ),
            ListTile(
              title: Text('Ratings and Reviews'),
              onTap: () {
                // Navigate to the Find a Cook page or screen
                Navigator.pushReplacementNamed(context,'/rate');// Close the Drawer
                // You can add further navigation logic here
              },
            ),
            ListTile(
              title: Text('FAQ'),
              onTap: () {
                // Navigate to the Find a Cook page or screen
                Navigator.pushReplacementNamed(context,'/faq');// Close the Drawer
                // You can add further navigation logic here
              },
            ),
            ListTile(
              title: Text('About Us'),
              onTap: () {
                // Navigate to the Find a Cook page or screen
                Navigator.pushReplacementNamed(context,'/about');// Close the Drawer
                // You can add further navigation logic here
              },
            ),
            ListTile(
              title: Text('Log Out'),
              onTap: () {
                // Navigate to the Find a Cook page or screen
                Navigator.pop(context); // Close the Drawer
                // You can add further navigation logic here
              },
            ),// Add more ListTiles for other pages as needed
          ],
        ),
      ),
      body: Column(
        children: [
          // Carousel section
          CarouselSlider(
            items: [
              // Add your images here
              Image.asset('assets/image1.jpg'),
              Image.asset('assets/image2.jpg'),
              Image.asset('assets/image3.jpg'),
            ],
            options: CarouselOptions(
              height: 200,
              autoPlay: true,
              enlargeCenterPage: true,
            ),
          ),
          SizedBox(height: 20),
          // Offers and Discounts section
          ListTile(
            title: Text(
              'Special Offers and Discounts',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            subtitle: Text('Check out our latest offers and discounts!'),
          ),
          // Your offer and discount widgets go here

          // Category selection
          CategorySelectionWidget(),

          // Cook details section
          SizedBox(height: 20),
          CookDetailsWidget(
            cookName: 'John Doe',
            specialty: 'Italian Cuisine',
            availability: 'Available Now',
            profileImagePath: 'assets/cook_profile.jpg',
            category: 'Veg',
          ),

          // "Book your cook now!" line
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Navigate to the "Find a Cook" screen or perform the desired action
              // For now, print a message to the console
              Navigator.pushReplacementNamed(context, '/home2');
              print('Find a Cook button pressed!');
            },
            child: Text('Find a Cook'),
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
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Veg category
          CategoryItemWidget('Veg', 'assets/veg_icon.png'),

          // Spacer for some separation
          SizedBox(width: 20),

          // Non-Veg category
          CategoryItemWidget('Non-Veg', 'assets/non_veg_icon.png'),
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
        // Circular image with text
        CircleAvatar(
          radius: 50,
          backgroundImage: AssetImage(iconImagePath),
        ),
        SizedBox(height: 5),
        // Category name text
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
    String cookDetails = "Cook: $cookName\nSpecialty: $specialty\nAvailability: $availability";

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Cook's profile picture
          CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage(profileImagePath),
          ),
          SizedBox(height: 10),

          // Category (Veg/Non-Veg)
          Text(
            category,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),

          // Cook details text
          Text(
            cookDetails,
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}


