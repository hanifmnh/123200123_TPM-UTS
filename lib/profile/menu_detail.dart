import 'package:flutter/material.dart';

class MenuDetail extends StatelessWidget {
  const MenuDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            CircleAvatar(
              radius: 100,
              backgroundImage: AssetImage('assets/profile.jpeg'),
            ),
            SizedBox(height: 20),
            Text(
              'Muhammad Nur Hanif',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'NIM: 123200123',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Kelas: IF-E',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Tempat/Tanggal Lahir: Yogyakarta, 30 April 2002',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Cita-Cita: Menjadi Front-End Developer',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
