import 'package:flutter/material.dart';
import 'package:exanpopcode/screens/favorite.dart';
import 'package:exanpopcode/screens/listPeople.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext con5text) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "ExanPopCode",
      theme: ThemeData(appBarTheme: AppBarTheme(color: Colors.grey[850])),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Star wars'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.star),
            onPressed: () async {
              await Navigator.push(context,
                  new MaterialPageRoute(builder: (context) => Favorite()));
            },
          ),
        ],
      ),
      body: ListPeople(),
    );
  }
}
