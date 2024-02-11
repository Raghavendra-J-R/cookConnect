import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cuisine Selection',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BookPage(),
    );
  }
}

class CuisineButton extends StatefulWidget {
  final String title;
  final bool isSelected;
  final Function onTap;

  CuisineButton({required this.title, required this.isSelected, required this.onTap});

  @override
  _CuisineButtonState createState() => _CuisineButtonState();
}

class _CuisineButtonState extends State<CuisineButton> {
  bool _isSelected = false;

  @override
  void initState() {
    super.initState();
    _isSelected = widget.isSelected;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onTap();
        setState(() {
          _isSelected = !_isSelected;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: _isSelected ? Colors.blue : Colors.grey[200],
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(
          widget.title,
          style: TextStyle(color: _isSelected ? Colors.white : Colors.black),
        ),
      ),
    );
  }
}

class BookPage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<BookPage> {
  bool _northIndian = false;
  bool _southIndian = false;
  bool _italian = false;
  bool _chinese = false;
  bool _mexican = false;
  bool _veg = false;
  bool _nonVeg = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cuisine Selection'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Select cuisine based on preference',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CuisineButton(
                  title: 'North Indian',
                  isSelected: _northIndian,
                  onTap: () {
                    setState(() {
                      _northIndian = !_northIndian;
                    });
                  },
                ),
                CuisineButton(
                  title: 'South Indian',
                  isSelected: _southIndian,
                  onTap: () {
                    setState(() {
                      _southIndian = !_southIndian;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CuisineButton(
                  title: 'Italian',
                  isSelected: _italian,
                  onTap: () {
                    setState(() {
                      _italian = !_italian;
                    });
                  },
                ),
                CuisineButton(
                  title: 'Chinese',
                  isSelected: _chinese,
                  onTap: () {
                    setState(() {
                      _chinese = !_chinese;
                    });
                  },
                ),
                CuisineButton(
                  title: 'Mexican',
                  isSelected: _mexican,
                  onTap: () {
                    setState(() {
                      _mexican = !_mexican;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CuisineButton(
                  title: 'Veg',
                  isSelected: _veg,
                  onTap: () {
                    setState(() {
                      _veg = !_veg;
                    });
                  },
                ),
                CuisineButton(
                  title: 'Non-Veg',
                  isSelected: _nonVeg,
                  onTap: () {
                    setState(() {
                      _nonVeg = !_nonVeg;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/time');
              },
              child: Text('Continue'),
            ),
          ],
        ),
      ),
    );
  }
}