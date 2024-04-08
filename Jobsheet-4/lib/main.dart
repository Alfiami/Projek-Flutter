import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jobsheet Mobile Programming',
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 145, 188, 208),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 16, 24, 34),
          title: const Text(
            'Welcome to Jobsheet 4',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: const Center(
          child: Text('Alfiami Sholihatun | STI202102373'),
        ),
      ),
    );
  }
}
