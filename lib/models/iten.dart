class Iten {
  String title;
  bool done;

  Iten({this.title, this.done});

  Iten.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    title = json['done'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['done'] = this.done;
    return data;
  }
}