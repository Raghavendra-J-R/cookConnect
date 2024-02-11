import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Preferred Time',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SelectDate(),
    );
  }
}

class SelectDate extends StatefulWidget {
  @override
  _SelectDateState createState() => _SelectDateState();
}

class _SelectDateState extends State<SelectDate> {
  int _hour = 9;
  int _minute = 41;
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Preferred Time'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TableCalendar(
                firstDay: DateTime.utc(2023, 1, 1),
                lastDay: DateTime.utc(2030, 12, 31),
                focusedDay: _selectedDate,
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    _selectedDate = selectedDay;
                  });
                },
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.date_range,
                            size: 20,
                            color: Colors.grey[600],
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: 'Select date',
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.access_time,
                            size: 20,
                            color: Colors.grey[600],
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment
                                  .spaceBetween,
                              children: [
                                DropdownButton<int>(
                                  value: _hour,
                                  onChanged: (value) {
                                    setState(() {
                                      _hour = value!;
                                    });
                                  },
                                  items: List<int>.generate(
                                      24, (index) => index + 1)
                                      .map((hour) {
                                    return DropdownMenuItem<int>(
                                      value: hour,
                                      child: Text('$hour'),
                                    );
                                  }).toList(),
                                ),
                                Text(':'),
                                DropdownButton<int>(
                                  value: _minute,
                                  onChanged: (value) {
                                    setState(() {
                                      _minute = value!;
                                    });
                                  },
                                  items: List<int>.generate(
                                      60, (index) => index + 1)
                                      .map((minute) {
                                    return DropdownMenuItem<int>(
                                      value: minute,
                                      child: Text('$minute'),
                                    );
                                  }).toList(),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/final');
                },
                child: Text('Submit'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.orangeAccent,
                  onPrimary: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
