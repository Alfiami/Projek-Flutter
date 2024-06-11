import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: SafeArea(
        child: MyApp(),
      ),
    ),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Wrap(
          children: [
            buatKotak(Colors.greenAccent, 100),
            buatKotak(Colors.orangeAccent[400]!, 70),
            buatKotak(Colors.greenAccent, 50),
            buatKotak(Colors.orangeAccent[400]!, 90),
            buatKotak(Colors.red[300]!, 110),
            buatKotak(Colors.blue[300]!, 30),
          ],
        ),
        Text(
          'Alfiami Sholihatun',
          style: TextStyle(fontSize: 20),
        ),
      ],
    );
  }
}

Widget buatKotak(Color warna, double ukuran) {
  return Container(
    decoration: BoxDecoration(
      color: warna,
    ),
    height: ukuran,
    width: ukuran,
    margin: EdgeInsets.all(10),
  );
}
