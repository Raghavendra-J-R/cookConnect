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
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, '/home');
        break;
      case 1:
        Navigator.pushReplacementNamed(context, '/home/faq');
        break;
      case 2:
        Navigator.pushReplacementNamed(context, '/home/cook');
        break;
      case 3:
        _showLogoutConfirmationDialog();
        break;
    }
  }

  Future<void> _showLogoutConfirmationDialog() async {
    await showModalBottomSheet<void>(
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
                      await widget._auth.signOut();
                      print('User logged out!');
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Successfully Logged out'),
                        ),
                      );
                      Navigator.pushReplacementNamed(context, '/login');
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
  }

  Widget _buildCouponCard(
      {required String title, required String description}) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CookConnect'),

        actions: [
          // Profile icon button
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () {
              // Navigate to the "Find a Cook" screen or perform the desired action
              // For now, print a message to the console

              print('Profile button pressed!');
            },
          ),
        ], // Adding a Drawer button
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            CarouselSlider(
              items: [
                _buildCouponCard(
                  title: '50% Off',
                  description: 'Get 50% off on your next meal!',
                ),
                _buildCouponCard(
                  title: 'Free Delivery',
                  description: 'Enjoy free delivery on orders over \$50.',
                ),
                _buildCouponCard(
                  title: 'BOGO Offer',
                  description: 'Buy one, get one free on select items.',
                ),
              ],
              options: CarouselOptions(
                height: 200,
                autoPlay: true,
                enlargeCenterPage: true,
              ),
            ),
            const SizedBox(height: 20),
            Card(
              color: Colors.lightBlueAccent,
              margin: const EdgeInsets.all(10.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 4,
              child: Column(
                children: [
                  Row(
                    children: [
                      // Circular Cook Image
                      Container(
                        padding: const EdgeInsets.all(
                            8.0), // Adjust the padding as needed
                        child: ClipOval(
                          child: Image.asset(
                            'assets/cook2.jpg',
                            height: 100,
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(
                          width: 10), // Spacer between image and text
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'We are ',
                              style: TextStyle(fontSize: 20),
                            ),
                            Text(
                              'Join us as we embark on a delicious adventure, one meal at a time.',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                      height: 10), // Spacer between top and bottom content
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/home/about');
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.orangeAccent,
                        minimumSize:
                            Size(MediaQuery.of(context).size.width, 56),
                      ),
                      child: const Text(
                        'Learn more',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            const SizedBox(height: 15),
            const ListTile(
              title: Text(
                'Our Services',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Card(
              margin: const EdgeInsets.all(10.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 4,
              child: Column(
                children: [
                  Row(
                    children: [
                      // Circular Cook Image
                      Container(
                        padding: const EdgeInsets.all(
                            8.0), // Adjust the padding as needed
                        child: ClipOval(
                          child: Image.asset(
                            'assets/pic3.jpg',
                            height: 100,
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(
                          width: 10), // Spacer between image and text
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Book for one meal',
                              style: TextStyle(fontSize: 20),
                            ),
                            Text(
                              'Join us as we embark on a delicious adventure, one meal at a time.',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                      height: 10), // Spacer between top and bottom content
                ],
              ),
            ),
            Card(
              margin: const EdgeInsets.all(10.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 4,
              child: Column(
                children: [
                  Row(
                    children: [
                      // Circular Cook Image
                      Container(
                        padding: const EdgeInsets.all(
                            8.0), // Adjust the padding as needed
                        child: ClipOval(
                          child: Image.asset(
                            'assets/pic1.jpg',
                            height: 100,
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(
                          width: 10), // Spacer between image and text
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Book for one month',
                              style: TextStyle(fontSize: 20),
                            ),
                            Text(
                              'Join us as we embark on a delicious adventure, one meal at a time.',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                      height: 10), // Spacer between top and bottom content
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.amber,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.help,
              color: Colors.amber,
            ),
            label: 'FAQ',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.local_dining_sharp,
              color: Colors.amber,
            ),
            label: 'Find Cook',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.logout,
              color: Colors.amber,
            ),
            label: 'Log Out',
          ),
        ],
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
