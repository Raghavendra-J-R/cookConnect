// TODO Implement this library.
import 'package:flutter/material.dart';

class FAQPage extends StatelessWidget {
  final List<FAQItem> faqItems = [
    FAQItem(
      question: 'How do I book a cook?',
      answer:
          'To book a cook, navigate to the "Find a Cook" section and follow the instructions to select a cook and schedule a booking.',
    ),
    FAQItem(
      question: 'How do I contact my cook?',
      answer:
          'You can contact your cook by going to the "Cook Details" section of the app and selecting the booking for which you want to contact the cook. From there, you can get the contact of the cook through the app.',
    ),
    FAQItem(
      question: 'How can I contact customer support?',
      answer:
          'For assistance, please contact our customer support team at support@cook.in or call our helpline at +91 6382465321.',
    ),
    // Add more FAQ items as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FAQ'),
        backgroundColor: Colors.orangeAccent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Navigate back to the home page
            Navigator.pushReplacementNamed(context, '/home');
          },
        ),
      ),
      body: ListView.builder(
        itemCount: faqItems.length,
        itemBuilder: (context, index) {
          return ExpansionTile(
            title: Text(faqItems[index].question),
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(faqItems[index].answer),
              ),
            ],
          );
        },
      ),
    );
  }
}

class FAQItem {
  final String question;
  final String answer;

  FAQItem({required this.question, required this.answer});
}
