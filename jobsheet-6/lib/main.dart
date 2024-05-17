import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Daftar Mahasiswa',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Daftar Mahasiswa'),
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              MahasiswaTile('JULIA KURNIA MUBAROKAH', 'STI202102363'),
              MahasiswaTile('AMIN SURATUN KHASANAH', 'STI202102368'),
              MahasiswaTile('ALFIAMI SHOLIHATUN', 'STI202102373', isMe: true),
              MahasiswaTile('RUSMIATI', 'STI202102380'),
              MahasiswaTile('SATNA SETIYANA', 'STI202102386'),
            ],
          ),
        ),
      ),
    );
  }
}

class MahasiswaTile extends StatelessWidget {
  final String name;
  final String absenNumber;
  final bool isMe;

  const MahasiswaTile(this.name, this.absenNumber, {this.isMe = false});

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = isMe ? Colors.green : Colors.transparent;
    return Container(
      color: backgroundColor,
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  name,
                  style: TextStyle(fontSize: 18.0),
                ),
                SizedBox(height: 4.0),
                Text(
                  'NIM: $absenNumber',
                  style: TextStyle(fontSize: 14.0),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}