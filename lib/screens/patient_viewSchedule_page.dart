import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vibrant Calendar App',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: ViewSchedulePage(),
    );
  }
}

class ViewSchedulePage extends StatefulWidget {
  @override
  _ViewSchedulePageState createState() => _ViewSchedulePageState();
}

class _ViewSchedulePageState extends State<ViewSchedulePage> {
  DateTime _selectedDate = DateTime.now();
  DateTime? _searchedDate;
  final TextEditingController _searchController = TextEditingController();

  void _searchDate() {
    String input = _searchController.text;
    try {
      DateTime parsedDate = DateFormat('dd/MM/yyyy').parse(input);
      if (parsedDate.month == _selectedDate.month &&
          parsedDate.year == _selectedDate.year) {
        setState(() {
          _searchedDate = parsedDate;
        });
      } else {
        setState(() {
          _searchedDate = null;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Date not in the current month!')),
        );
      }
    } catch (e) {
      setState(() {
        _searchedDate = null;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Invalid date format! Use dd/MM/yyyy')),
      );
    }
  }

  int _getDaysInMonth(int year, int month) {
    return DateTime(year, month + 1, 0).day;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("View Schedule"),
        backgroundColor: const Color(0xFF00796B),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF00796B), Color(0xFF004D40)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
            ),
            child: Text(
              DateFormat('MMMM yyyy').format(_selectedDate),
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search Date (dd/MM/yyyy)',
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: _searchDate,
                ),
              ),
              keyboardType: TextInputType.datetime,
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 5,
                    blurRadius: 10,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 7,
                  childAspectRatio: 1.0,
                ),
                itemCount: _getDaysInMonth(
                    _selectedDate.year, _selectedDate.month),
                itemBuilder: (context, index) {
                  DateTime day = DateTime(
                      _selectedDate.year, _selectedDate.month, index + 1);
                  bool isSelected = _searchedDate != null &&
                      _searchedDate!.day == day.day &&
                      _searchedDate!.month == day.month &&
                      _searchedDate!.year == day.year;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedDate = day;
                        _searchedDate = null;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.all(4.0),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? const Color(0xFF00796B)
                            : (_selectedDate.day == day.day
                                ? const Color(0xFF004D40)
                                : Colors.transparent),
                        border: Border.all(
                          color: const Color(0xFF00796B).withOpacity(0.5),
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          '${index + 1}',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: isSelected
                                ? Colors.white
                                : const Color(0xFF004D40),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
