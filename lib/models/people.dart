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

  Result({
    this.name,
    this.height,
    this.gender,
    this.mass,
  });

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      name: json['name'],
      height: json['height'],
      gender: json['gender'],
      mass: json['mass'],
    );
  }
}
