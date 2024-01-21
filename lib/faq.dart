// TODO Implement this library.
import 'package:flutter/material.dart';

class FAQPage extends StatelessWidget {
  final List<FAQItem> faqItems = [
    FAQItem(
      question: 'How do I book a cook?',
      answer: 'To book a cook, navigate to the "Find a Cook" section and follow the instructions to select a cook and schedule a booking.',
    ),
    FAQItem(
      question: 'Can I cancel a booking?',
      answer: 'Yes, you can cancel a booking by going to the "My Bookings" section and selecting the booking you want to cancel. Follow the prompts to cancel the booking.',
    ),
    FAQItem(
      question: 'How can I contact customer support?',
      answer: 'For assistance, please contact our customer support team at support@example.com or call our helpline at (123) 456-7890.',
    ),
    // Add more FAQ items as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FAQ'),
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

void main() {
  runApp(MaterialApp(
    home: FAQPage(),
  ));
}
