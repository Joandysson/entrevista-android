import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'models/iten.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "exan App",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  var itens = new List<Iten>();

  HomePage() {
    itens = [];
    // itens.add(Iten(title: "item 1", done: true));
    // itens.add(Iten(title: "item 2", done: false));
    // itens.add(Iten(title: "item 3", done: true));
  }

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var newTaskCtrl = TextEditingController();

  void add() {
    if (newTaskCtrl.text.isEmpty) return;
    setState(() {
      widget.itens.add(
        Iten(title: newTaskCtrl.text, done: false),
      );
      newTaskCtrl.clear();
      save();
    });
  }

  void remove(int index) {
    setState(() {
      widget.itens.removeAt(index);
      save();
    });
  }

  Future load() async {
    var prefs = await SharedPreferences.getInstance();
    var data = prefs.getString('data');
    if (data != null) {
      Iterable decoded = jsonDecode(data);
      List<Iten> result = decoded.map((x) => Iten.fromJson(x)).toList();
      setState(() {
        widget.itens = result;
      });
    }
  }

  save() async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setString('data', jsonEncode(widget.itens));
  }

  _HomePageState() {
    load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextFormField(
          controller: newTaskCtrl,
          keyboardType: TextInputType.text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
          decoration: InputDecoration(
              labelText: "Texto",
              labelStyle: TextStyle(
                color: Colors.white,
              )),
        ),
        actions: <Widget>[
          Center(
            child: Icon(Icons.attach_money),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: widget.itens.length,
        itemBuilder: (BuildContext ctxt, int index) {
          final iten = widget.itens[index];

          return Dismissible(
            child: CheckboxListTile(
              title: Text(iten.title),
              value: iten.done,
              onChanged: (value) {
                setState(() {
                  iten.done = value;
                  save();
                });
              },
            ),
            key: Key(iten.title),
            background: Container(color: Colors.red.withOpacity(0.5)),
            onDismissed: (direction) {
              remove(index);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: add,
        child: Icon(Icons.add),
        // backgroundColor: Colors.pink,
      ),
    );
  }
}
