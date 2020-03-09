List<Result> results = new List<Result>();

// https://github.com/brianegan/swapi_client/blob/master/lib/src/client.dart

class People {
  int count;
  String next;
  dynamic previous;
  List<Result> results;

  People({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  factory People.fromJson(Map<String, dynamic> json) {
    return People(
      count: json['count'],
      next: json['next'],
      previous: json['previous'],
      results: _parseResult(json['results']),
    );
  }
}

_parseResult(List<dynamic> data) {
  data.forEach((item) {
    results.add(Result.fromJson(item));
  });
  return results;
}

class Result {
  String name;
  String height;
  String gender;
  String mass;
  String hairColor;
  String skinColor;
  String eyeColor;
  String birthYear;
  String homeworld;
  String species;

  Result({
    this.name,
    this.height,
    this.gender,
    this.mass,
    this.hairColor,
    this.skinColor,
    this.eyeColor,
    this.birthYear,
    this.homeworld,
    this.species,
  });

  factory Result.fromJson(Map<String, dynamic> json) {
    List list = json['species'];
    var species = '';
    if (list.length > 0) {
      species = list[0];
    }

    return Result(
      name: json['name'],
      height: json['height'],
      gender: json['gender'],
      mass: json['mass'],
      hairColor: json['hair_color'],
      skinColor: json['skin_color'],
      eyeColor: json['eye_color'],
      birthYear: json['birth_year'],
      homeworld: json['homeworld'],
      species: species,
    );
  }
}
