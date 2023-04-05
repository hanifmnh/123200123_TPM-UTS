import 'package:flutter/material.dart';

class MenuTrapesium extends StatefulWidget {
  const MenuTrapesium({Key? key}) : super(key: key);

  @override
  State<MenuTrapesium> createState() => _MenuTrapesiumState();
}

class _MenuTrapesiumState extends State<MenuTrapesium> {
  final inputAController = TextEditingController();
  final inputBController = TextEditingController();
  final inputCController = TextEditingController();
  final inputDController = TextEditingController();

  double luas = 0;
  double keliling = 0;

  void _hitungLuasKeliling() {
    double a = double.tryParse(inputAController.text) ?? 0.0;
    double b = double.tryParse(inputBController.text) ?? 0.0;
    double c = double.tryParse(inputCController.text) ?? 0.0;
    double d = double.tryParse(inputDController.text) ?? 0.0;

    setState(() {
      luas = ((a + b) * c) / 2;
      keliling = a + b + c + d;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trapesium'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
                "Menghitung Trapesium",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                )
            ),
            const SizedBox(height: 50),
            TextFormField(
              controller: inputAController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Masukkan Sisi A',
                contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  borderSide: BorderSide(color: Colors.blue),
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: inputBController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Masukkan Sisi B',
                contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  borderSide: BorderSide(color: Colors.blue),
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: inputCController,
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
            const SizedBox(height: 16),
            TextFormField(
              controller: inputDController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Masukkan Sisi D',
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
              'Luas Trapesium: $luas',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            Text(
              'Keliling Trapesium: $keliling',
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
