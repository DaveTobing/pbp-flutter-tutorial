import 'package:lab6/page/form.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:lab6/page/to_do_page.dart';

void main() {
  runApp(const MyApp());
}

Mobil mobilFromJson(String str) => Mobil.fromJson(json.decode(str));
String mobilToJson(Mobil data) => json.encode(data.toJson());

class Mobil {
    Mobil({
        required this.id,
        required this.brand,
        required this.model,
        required this.color,
    });

    int id;
    String brand;
    String model;
    String color;

    factory Mobil.fromJson(Map<String, dynamic> json) => Mobil(
         id: json["id"],
         brand: json["brand"],
         model: json["model"],
         color: json["color"],
    );

    Map<String, dynamic> toJson() => {
          "id": id,
          "brand": brand,
          "model": model,
          "color": color,
    };
}


class MyApp extends StatelessWidget {
    const MyApp({super.key});

    @override
    Widget build(BuildContext context) {
        return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(),
        );
    }
}

class MyHomePage extends StatefulWidget {
    const MyHomePage({super.key});

    final String title = 'Flutter Demo Home Page';

    @override
    State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: Drawer(
          child: Column(
            children: [
              // Menambahkan clickable menu
              ListTile(
                title: const Text('Counter'),
                onTap: () {
                  // Route menu ke halaman utama
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const MyHomePage()),
                  );
                },
              ),
              ListTile(
                title: const Text('Form'),
                onTap: () {
                  // Route menu ke halaman form
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const MyFormPage()),
                  );
                },
              ),
              ListTile(
              title: const Text('To Do'),
              onTap: () {
                  // Route menu ke halaman to do
                  Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const TODoPage()),
                );
            },
            ),
            ],
          ),
        ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have clicked the button this many times',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
