// TODO Implement this library.
import 'package:flutter/material.dart';

class RateAndReviewPage extends StatefulWidget {
  @override
  _RateAndReviewPageState createState() => _RateAndReviewPageState();
}

class _RateAndReviewPageState extends State<RateAndReviewPage> {
  double rating = 0.0;
  TextEditingController reviewController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rate and Review'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Navigate back to the home page
            Navigator.pushReplacementNamed(context, '/home');
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Rating Stars
            const Text(
              'Rate the Cook:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            RatingBar(
              onRatingChanged: (value) {
                setState(() {
                  rating = value;
                });
              },
              filledIcon: Icons.star,
              emptyIcon: Icons.star_border,
              filledColor: Colors.orange,
              emptyColor: Colors.grey,
              size: 30,
            ),
            const SizedBox(height: 20),

            // Review Text Field
            const Text(
              'Write a Review:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: reviewController,
              maxLines: 5,
              decoration: const InputDecoration(
                hintText: 'Type your review here...',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            // Submit Button
            ElevatedButton(
              onPressed: () {
                // TODO: Implement code to submit the rating and review to the server
                // You can send the 'rating' and 'reviewController.text' to your backend for storage
                // You may also want to add validation before submitting
                // Example: if (rating > 0 && reviewController.text.isNotEmpty) { /* submit */ }
                // Add your logic here
                // After submitting, you can navigate back or perform any other desired action
                Navigator.pushReplacementNamed(context, '/home');
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}

class RatingBar extends StatefulWidget {
  final IconData filledIcon;
  final IconData emptyIcon;
  final Color filledColor;
  final Color emptyColor;
  final double size;
  final ValueChanged<double> onRatingChanged;

  RatingBar({
    required this.onRatingChanged,
    this.filledIcon = Icons.star,
    this.emptyIcon = Icons.star_border,
    this.filledColor = Colors.orange,
    this.emptyColor = Colors.grey,
    this.size = 24,
  });

  @override
  _RatingBarState createState() => _RatingBarState();
}

class _RatingBarState extends State<RatingBar> {
  double rating = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              rating = index + 1.0;
              widget.onRatingChanged(rating);
            });
          },
          child: Icon(
            index < rating ? widget.filledIcon : widget.emptyIcon,
            color: index < rating ? widget.filledColor : widget.emptyColor,
            size: widget.size,
          ),
        );
      }),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: RateAndReviewPage(),
  ));
}
