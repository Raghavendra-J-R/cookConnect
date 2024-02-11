import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food Ordering App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SelectTime(),
    );
  }
}

class SelectTime extends StatefulWidget {
  @override
  _BookPageState createState() => _BookPageState();
}

class _BookPageState extends State<SelectTime> {
  int _numPeople = 1;
  bool _isBreakfastSelected = false;
  bool _isLunchSelected = false;
  bool _isDinnerSelected = false;
  bool _isAllSelected = false;

  void _selectPeople(int numPeople) {
    setState(() {
      _numPeople = numPeople;
    });
  }

  void _selectMeal(String meal) {
    if (meal == 'Breakfast') {
      _isBreakfastSelected = true;
      _isLunchSelected = false;
      _isDinnerSelected = false;
      _isAllSelected = false;
    } else if (meal == 'Lunch') {
      _isBreakfastSelected = false;
      _isLunchSelected = true;
      _isDinnerSelected = false;
      _isAllSelected = false;
    } else if (meal == 'Dinner') {
      _isBreakfastSelected = false;
      _isLunchSelected = false;
      _isDinnerSelected = true;
      _isAllSelected = false;
    } else if (meal == 'all') {
      _isBreakfastSelected = false;
      _isLunchSelected = false;
      _isDinnerSelected = false;
      _isAllSelected = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text('Food Ordering App'),
    ),
    body: SingleChildScrollView(
    child: Padding(
    padding: const EdgeInsets.all(20.0),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
    Text(
    'What would you like to have on the day of trial?',
    style: TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    ),
    ),
    SizedBox(height: 20),
    Text(
    'Name of your favourite cuisine',
    style: TextStyle(
    fontSize: 16,
    color: Colors.grey[600],
    ),
    ),
    SizedBox(height: 10),
    Container(
    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    decoration: BoxDecoration(
    border: Border.all(color: Colors.grey),
    borderRadius: BorderRadius.circular(5),
    ),
    child: Row(
    children: [
    Icon(
    Icons.restaurant,
    size: 20,
    color: Colors.grey[600],
    ),
    SizedBox(width: 10),
    Expanded(
    child: TextFormField(
    decoration: InputDecoration(
    hintText: 'Enter cuisine name',
    border: InputBorder.none,
    ),
    ),
    ),
    ],
    ),
    ),
    SizedBox(height: 20),
    Text(
    'Select Number of People?',
    style: TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    ),
    ),
    SizedBox(height: 10),
    Row(
    children: [
    Radio(
    value: 1,
    groupValue: _numPeople,
    onChanged: (value) {
    _selectPeople(value as int);
    },
    ),
    Text('1'),
    Radio(
    value: 2,
    groupValue: _numPeople,
    onChanged: (value) {
    _selectPeople(value as int);
    },
    ),
    Text('2'),
    Radio(
    value: 3,
    groupValue: _numPeople,
    onChanged: (value) {
    _selectPeople(value as int);
    },
    ),
    Text('3'),
    Radio(
    value: 4,
    groupValue: _numPeople,
    onChanged: (value) {
    _selectPeople(value as int);
    },
    ),
    Text('4+'),
    ],
    ),
    SizedBox(height: 20),
    Text(
    'Select Meal Time',
    style: TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    ),
    ),
    SizedBox(height: 10),
    Column(
    children: [
    Row(
    children: [
    Checkbox(
    value: _isBreakfastSelected,
    onChanged: (value) {
    _selectMeal(value! ? 'Breakfast' : 'all');
    },
    ),
    Text('Breakfast'),
    ],
    ),
    Row(
    children: [
    Checkbox(
    value: _isLunchSelected,
    onChanged: (value) {
    _selectMeal(value! ? 'Lunch' : 'all');
    },
    ),
    Text('Lunch'),
    ],
    ),
    Row(
    children: [
    Checkbox(
    value: _isDinnerSelected,
    onChanged: (value) {
    _selectMeal(value! ? 'Dinner' : 'all');
    },
    ),
    Text('Dinner'),
    ],
    ),
    ],
    ),
    SizedBox(height: 20),
    Center(
    child:ElevatedButton(
    onPressed: () {
      Navigator.pushReplacementNamed(context, '/date');
    },
    child: Text('Submit'),
    style: ElevatedButton.styleFrom(
    primary: Colors.blue,
    onPrimary: Colors.white,
    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(5),
    ),
    ),
    ),

    ),
    ],
    ),
    ),
    )
    );
  }
}