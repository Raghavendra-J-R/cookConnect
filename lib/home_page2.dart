// TODO Implement this library.
//this isnt homepage, but when clicked on button on home page, this will open.
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cook Finder App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage2(),
    );
  }
}

class HomePage2 extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage2> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    CookFinderPage(),
    FavoritesPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cook Finder'),
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Find Cook',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class CookFinderPage extends StatelessWidget {
  final List<String> offers = [
    'Free dessert with every order!',
    '50% off on your first meal!',
    'Special discount on family packages!',
  ];

  final List<String> locations = [
    'City A',
    'City B',
    'City C',
  ];

  final List<String> reviews = [
    'Great service and delicious food!',
    'Quick delivery and affordable prices.',
    'Friendly staff and a variety of options.',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Find Cook Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Current Offers',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Container(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: offers.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(offers[index]),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Available in',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Container(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: locations.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(locations[index]),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Customer Reviews',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: reviews
                    .map((review) => Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('"$review"'),
                  ),
                ))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FavoritesPage extends StatelessWidget {
  // Dummy data for favorite cooks
  final List<CookProfile> favoriteCooks = [
    CookProfile(name: 'Cook Nick', specialty: 'South Indian', image: 'assets/chef1.jpg'),
    CookProfile(name: 'Cook Joe', specialty: 'North Indian', image: 'assets/chef2.jpg'),
    CookProfile(name: 'Cook Kevin', specialty: 'Chinese', image: 'assets/chef3.jpg'),
    // Add more cooks as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: favoriteCooks.length,
          itemBuilder: (context, index) {
            return CookProfileCard(cookProfile: favoriteCooks[index]);
          },
        ),
      ),
    );
  }
}

class CookProfile {
  final String name;
  final String specialty;
  final String image;

  CookProfile({
    required this.name,
    required this.specialty,
    required this.image,
  });
}

class CookProfileCard extends StatelessWidget {
  final CookProfile cookProfile;

  CookProfileCard({required this.cookProfile});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage(cookProfile.image),
        ),
        title: Text(cookProfile.name),
        subtitle: Text(cookProfile.specialty),
        // You can add more actions or details here
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Dummy user data
    User user = User(
      name: 'Priyanka Chopra',
      profilePic: 'assets/profile_pic.jpg',
      numberOfOrders: 25,
      membershipDetails: 'Premium Member', // Replace with actual membership details or plan
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Page'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage(user.profilePic),
                    ),
                    SizedBox(height: 16),
                    Text(
                      user.name,
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text('Number of Orders: ${user.numberOfOrders}'),
                    SizedBox(height: 8),
                    Text('Membership Details: ${user.membershipDetails}'),
                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        // TODO: Implement logout functionality
                      },
                      child: Text('Logout'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class User {
  final String name;
  final String profilePic;
  final int numberOfOrders;
  final String membershipDetails;

  User({
    required this.name,
    required this.profilePic,
    required this.numberOfOrders,
    required this.membershipDetails,
  });
}
