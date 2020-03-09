import 'package:flutter/material.dart';

class Read extends StatelessWidget {
  final String name;
  final String gender;
  final String mass;
  final String height;

  Read({
    Key key,
    this.gender,
    this.height,
    this.mass,
    this.name
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            _popNavigationWithResult(context, "from_back");
          },
        ),
        title: Text("Favoritos"),
      ),
      body: Container(
        child: Center(
          child: Card(
            elevation: 8.0,
            margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  title: Text(
                    name,
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                  ),
                  subtitle: Text(
                    "Genero $gender",
                    style: TextStyle(fontSize: 20,),
                  ),
                ),
                ListTile(
                  subtitle: Text(
                    "Peso: $mass Altura: $height",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                ButtonBar(
                  children: <Widget>[
                    FlatButton(
                      child: IconButton(icon: Icon(Icons.favorite_border), onPressed: () {}),
                      onPressed: () {/* ... */},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _popNavigationWithResult(BuildContext context, dynamic result) {
    Navigator.pop(context, result);
  }
}
