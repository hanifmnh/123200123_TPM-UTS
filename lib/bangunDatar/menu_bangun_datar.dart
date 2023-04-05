import 'package:flutter/material.dart';
import 'package:uts/bangunDatar/menu_trapesium.dart';
import 'package:uts/bangunDatar/menu_tabung.dart';

class MenuBangunDatar extends StatelessWidget {
  const MenuBangunDatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu Bangun Datar'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const MenuTrapesium()));
              },
              child: const SizedBox(
                child: Center(
                  child: Text(
                    "Trapesium",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                height: 50,
              ),
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const MenuTabung()));
              },
              child: const SizedBox(
                child: Center(
                  child: Text(
                    "Tabung",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                height: 50,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
