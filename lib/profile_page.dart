import 'package:flutter/material.dart';
class UserProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Replace these with actual user data
    String username = "John Doe";
    String email = "john.doe@example.com";
    String profileImagePath = "assets/user_profile_picture.jpg";

    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // User profile picture
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(profileImagePath),
            ),
            const SizedBox(height: 20),
            // User details
            Text(
              'Username: $username',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text(
              'Email: $email',
              style: TextStyle(fontSize: 18),
            ),
            // Add more user profile details as needed
          ],
        ),
      ),
    );
  }
}
