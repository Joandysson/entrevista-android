import 'package:exanpopcode/database/connection.dart';

class Default extends Connection {
  Future getall() async {
    var conn = await this.connect();
    var results = await conn.query('select * from people');
    List data = [];
    for (var row in results) {
      data.add([row[0],row[1],row[2]]);
    }
    await conn.close();
    return data;
  }

  Future getFavorites() async {
    var conn = await this.connect();
    var results = await conn.query('select * from people where favorite = 1');
    List data = [];
    for (var row in results) {
      data.add([row[0],row[2],row[3]]);
    }
    await conn.close();
    return data;
  }

  Future insert(String table, String fields, String values, List<dynamic> paraments) async {
    var conn = await this.connect();
    var result = await conn.query("insert into $table ($fields) values ($values)", paraments);
    await conn.close();
    return result.insertId;
  }
}
