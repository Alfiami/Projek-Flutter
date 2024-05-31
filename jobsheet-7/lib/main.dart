import 'package:flutter/material.dart';

class StateTeksUtama extends State<TeksUtama> {
  var listNama = [
    'Alfiami', 'Andi', 'Sari', 'Roti',
    'Mantap', 'Sekali', 'Enak', 'Nyam nyam'
  ];
  var listWarna = [
    Color.fromARGB(255, 128, 162, 195), Colors.purple, Colors.teal, Colors.lime,
    Colors.indigo, Colors.deepPurple, Colors.cyan,
    Colors.blue, Colors.yellow
  ];
  int index = 0;

  void incrementIndex() {
    setState(() {
      index++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 233, 240, 243),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            spreadRadius: 5,
            blurRadius: 5,
            offset: Offset(20, 20), 
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            'Apa kabar',
            textDirection: TextDirection.ltr,
          ),
          Text(
            listNama[index % listNama.length],
            textDirection: TextDirection.ltr,
            style: TextStyle(
              fontSize: 45,
              fontWeight: FontWeight.bold,
              color: listWarna[index % listWarna.length],
            ),
          ),
        ],
      ),
    );
  }
}

class TeksUtama extends StatefulWidget {
  final state = StateTeksUtama();

  @override
  State<StatefulWidget> createState() => state;
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TeksUtama teksUtama = TeksUtama();

    return MaterialApp(
      title: 'Halo Dunia',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Halo Dunia'),
          backgroundColor: Color.fromARGB(255, 202, 197, 255), 
        ),
        body: Center(
          child: Column(
            children: [
              teksUtama,
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          tooltip: 'Refresh',
          child: Icon(Icons.refresh),
          onPressed: teksUtama.state.incrementIndex,
        ),
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}
