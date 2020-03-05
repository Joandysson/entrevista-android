import 'package:http/http.dart' as http;
import 'package:exanpopcode/models/people.dart';
import 'dart:convert';
import 'dart:async';

String url = "https://swapi.co/api/people/?format=json";
int countpage = 2;

class StarWarsApi {
  static Future<People> getAllPeople() async {
    var response = await http.get(url);
    if (response.statusCode == 200) {
      People responseJson = People.fromJson(json.decode(response.body));
      if (responseJson.next != null) {
        url = "https://swapi.co/api/people/?format=json&page=$countpage";
        countpage++;
        return getAllPeople();
      }
      return responseJson;
    } else {
      throw Exception('Error');
    }
  }
}
