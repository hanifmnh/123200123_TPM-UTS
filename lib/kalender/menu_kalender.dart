import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';

class MenuKalender extends StatefulWidget {
  const MenuKalender({Key? key}) : super(key: key);

  @override
  State<MenuKalender> createState() => _MenuKalenderState();
}

class _MenuKalenderState extends State<MenuKalender> {
  DateTime _selectedDate = DateTime.now();
  int state = 0;

  final StreamController _wibController = StreamController();
  final StreamController _witaController = StreamController();
  final StreamController _witController = StreamController();

  void _selectDate(BuildContext context) async {
    final DateTime? newDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now().subtract(const Duration(days: 365)),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );

    if (newDate != null) {
      setState(() {
        _selectedDate = newDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kalender'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              DateFormat('EEEE, MMMM d, yyyy').format(_selectedDate),
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _selectDate(context),
              style: ElevatedButton.styleFrom(primary: Colors.green),
              child: const Text('Select Date'),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      state = 1;
                    });
                    _wibController.add(1);
                  },
                  style: ElevatedButton.styleFrom(primary: state == 1 ? Colors.green : Colors.blue),
                  child: const Text('WIB'),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      state = 2;
                    });
                    _witaController.add(2);
                  },
                  style: ElevatedButton.styleFrom(primary: state == 2 ? Colors.green : Colors.blue),
                  child: const Text('WITA'),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      state = 3;
                    });
                    _witController.add(3);
                  },
                  style: ElevatedButton.styleFrom(primary: state == 3 ? Colors.green : Colors.blue),
                  child: const Text('WIT'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            StreamBuilder(
              stream: _wibController.stream,
              builder: (context, snapshot) {
                if (state == 1) {
                  return StreamBuilder(
                    stream: Stream.periodic(
                      const Duration(seconds: 1), (int count) => count
                    ),
                    builder: (context, snapshot) {
                      return Text(
                        DateFormat('WIB : HH:mm:ss').format(DateTime.now()),
                        style: const TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    },
                  );
                } else {
                  return Container();
                }
              },
            ),
            StreamBuilder(
              stream: _witaController.stream,
              builder: (context, snapshot) {
                if (state == 2) {
                  return StreamBuilder(
                    stream: Stream.periodic(
                      const Duration(seconds: 1), (int count) => count
                    ),
                    builder: (context, snapshot) {
                      return Text(
                        DateFormat('WITA : HH:mm:ss').format(
                          DateTime.now().add(const Duration(hours: 1))
                        ),
                        style: const TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    },
                  );
                } else {
                  return Container();
                }
              },
            ),
            StreamBuilder(
              stream: _witController.stream,
              builder: (context, snapshot) {
                if (state == 3) {
                  return StreamBuilder(
                    stream: Stream.periodic(
                      const Duration(seconds: 1), (int count) => count
                    ),
                    builder: (context, snapshot) {
                      return Text(
                        DateFormat('WIT : HH:mm:ss').format(
                            DateTime.now().add(const Duration(hours: 2))
                        ),
                        style: const TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    },
                  );
                } else {
                  return Container();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
