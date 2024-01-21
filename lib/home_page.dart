import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';



class MyHomePage extends StatelessWidget {
  List<Widget> carouselItems = [
    Image.asset('assets/gojo.jpg'),
    Image.asset('assets/gojo.jpg'),
    Image.asset('assets/gojo.jpg'),
  ];

  MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CookConnect'),
        backgroundColor: Colors.amber,
      ),
      body: Column(
        children: [
          CarouselSlider(
            items: carouselItems,
            options: CarouselOptions(
              height: 200.0,
              enlargeCenterPage: true,
              autoPlay: true,
              aspectRatio: 16 / 9,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              viewportFraction: 0.8,
            ),
          ),
          const Expanded(
            child: Center(
              child: Text('Welcome to CookConnect'),
            ),
          ),
        ],
      ),
    );
  }
}
