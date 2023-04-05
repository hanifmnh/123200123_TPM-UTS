import 'package:flutter/material.dart';
import 'dart:math';

class MenuTabung extends StatefulWidget {
  const MenuTabung({Key? key}) : super(key: key);

  @override
  State<MenuTabung> createState() => _MenuTabungState();
}

class _MenuTabungState extends State<MenuTabung> {
  final jariJariController = TextEditingController();
  final tinggiController = TextEditingController();

  double luas = 0.0;
  double keliling = 0.0;

  void _hitungLuasKeliling() {
    double jariJari = double.tryParse(jariJariController.text) ?? 0.0;
    double tinggi = double.tryParse(tinggiController.text) ?? 0.0;

    setState(() {
      luas = 2 * pi * jariJari * (jariJari + tinggi);
      keliling = 2 * pi * jariJari;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tabung'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
                "Menghitung Tabung",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                )
            ),
            const SizedBox(height: 50),
            TextFormField(
              controller: jariJariController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Masukkan Jari-Jari',
                contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  borderSide: BorderSide(color: Colors.blue),
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: tinggiController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Masukkan Tinggi',
                contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  borderSide: BorderSide(color: Colors.blue),
                ),
              ),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: _hitungLuasKeliling,
              child: const SizedBox(
                child: Center(
                  child: Text(
                    "Hitung",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                height: 45,
              ),
            ),
            const SizedBox(height: 32),
            Text(
              'Luas Tabung: $luas',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            Text(
              'Keliling Tabung: $keliling',
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
