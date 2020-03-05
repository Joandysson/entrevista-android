import 'package:flutter/material.dart';
import 'package:exanpopcode/models/people.dart';
import 'package:exanpopcode/models/starwarsapi.dart';
import 'package:exanpopcode/components/read/read.dart';

class ListPeople extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future<People> people = StarWarsApi.getAllPeople();
    return FutureBuilder(
        future: people,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text("Error"));
          }
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          People people = snapshot.data;
          return _listView(people);
        });
  }

  _listView(people) {
    return Container(
      padding: const EdgeInsets.all(0.2),
      child: ListView.builder(
        itemCount: people.results == null ? 0 : people.results.length,
        itemBuilder: (BuildContext ctxt, int index) {
          String gender = "Não informado";

          var name = people.results[index].name;
          var height = people.results[index].height;
          var mass = people.results[index].mass;

          if (people.results[index].gender == "male") {
            gender = "Masculino";
          }

          if (people.results[index].gender == "female") {
            gender = "Feminino";
          }

          return Card(
            elevation: 8.0,
            margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
            child: Container(
              decoration: BoxDecoration(color: Colors.grey[800]),
              child: ListTile(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  // leading: Container(
                  //   padding: EdgeInsets.only(right: 12.0),
                  //   decoration: new BoxDecoration(
                  //       border: new Border(
                  //           right: new BorderSide(
                  //               width: 1.0, color: Colors.white24))),
                  //   child: Icon(Icons.autorenew, color: Colors.white),
                  // ),
                  title: Text(
                    name,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

                  subtitle: Row(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.remove_red_eye),
                        color: Colors.white,
                        onPressed: () async {
                          await Navigator.push(
                            ctxt,
                            new MaterialPageRoute(
                              builder: (ctxt) => Read(
                                  name: name,
                                  gender: gender,
                                  height: height,
                                  mass: mass),
                            ),
                          );
                        },
                      ),
                      Text("Gênero: $gender",
                          style: TextStyle(color: Colors.white))
                    ],
                  ),
                  trailing: IconButton(
                      icon: Icon(
                        Icons.favorite_border,
                        color: Colors.white,
                        size: 30.0,
                      ),
                      onPressed: () {})),
            ),
          );
        },
      ),
    );
  }
}
