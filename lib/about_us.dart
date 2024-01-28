import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome to CookConnect!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'At CookConnect, we believe that great food brings people together. Our app is designed to connect passionate cooks with food enthusiasts, creating a platform where delicious meals and culinary experiences are just a click away.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            Text(
              'Key Features:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '🍲 Find Your Perfect Cook: Browse through a diverse range of cooks, each with their unique specialties and culinary expertise. Whether you crave homemade comfort food or exotic international cuisines, CookConnect has the right cook for you.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              '🌟 Rate and Review: Share your dining experience by providing ratings and reviews for the meals you enjoy. Help others discover the best cooks and dishes in your community.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              '👩‍🍳 Connect with Cooks: Learn more about the talented cooks behind the meals. Follow your favorite cooks, get updates on their latest creations, and build a community around your love for good food.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            Text(
              'Join us on this culinary journey and experience the joy of home-cooked meals like never before. CookConnect – where great food and community come together!',
              style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
    );
  }
}
