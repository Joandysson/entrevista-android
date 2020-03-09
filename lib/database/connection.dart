import 'package:mysql1/mysql1.dart';

abstract class Connection {
  Future connect() async {
    final conn = await MySqlConnection.connect(ConnectionSettings(
      host: '10.0.2.2',
      port: 3306,
      user: 'root',
      db: 'star',
    ));
    return conn;
  }
}