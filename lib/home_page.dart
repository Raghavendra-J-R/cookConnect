import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatefulWidget {
  @override
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String _selectedTile = '';
  _HomePageState createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _handleMenuIconPressed() {
    _scaffoldKey.currentState?.openDrawer();
  }
  void _handleProfileIconPressed() {
    Navigator.pushReplacementNamed(context, '/profile');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CookConnect'),
        backgroundColor: Colors.orangeAccent,
        actions: [
          // Profile icon button
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: _handleProfileIconPressed,
          ),
        ],// Adding a Drawer button
      ),
      // Drawer widget
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.orangeAccent,
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
              title: const Text('Find a Cook'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/home/cook');
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
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
                showModalBottomSheet<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      height: 200,
                      color: Colors.amber,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            const Text('Are you sure you want to logout?'),
                            ElevatedButton(
                              child: const Text('Logout'),
                              onPressed: () async {
                                try {
                                  await widget._auth
                                      .signOut(); // Use widget._auth here
                                  print('User logged out!');
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Successfully Logged out'),
                                    ),
                                  );
                                  // Navigate back to the login page
                                  Navigator.pushReplacementNamed(
                                      context, '/login');
                                } catch (e) {
                                  print('Error during logout: $e');
                                }
                              },
                            ),
                            const SizedBox(height: 10),
                            ElevatedButton(
                              child: const Text('Cancel'),
                              onPressed: () => Navigator.pop(context),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
      body:SingleChildScrollView(
       child:Column(
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


          const SizedBox(height: 20),
          Row(
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           children: [
           SquareCard('Book for one Meal', 'assets/card1.jpg'),
           SquareCard('Book for a Day', 'assets/card2.jpg'),
           ],
           ),
         const SizedBox(height: 20),
         Row(
         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
         children: [
         SquareCard('Book for a party', 'assets/card3.jpg'),
         SquareCard('Book for a month', 'assets/card4.jpg'),
          ],
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
      ),
    );
  }
}

class SquareCard extends StatelessWidget {
  final String title;
  final String imagePath;

  SquareCard(this.title, this.imagePath);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 200,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          Image.asset(
            imagePath,
            width: 140,
            height: 160,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 10),

        ],
      ),
    );
  }
}




