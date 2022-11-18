class consoleModel {
  int? count;
  String? next;
  Null? previous;
  List<Results>? results;

  consoleModel({this.count, this.next, this.previous, this.results});

  consoleModel.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(new Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    data['next'] = this.next;
    data['previous'] = this.previous;
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  int? id;
  String? name;
  String? developer;
  String? generation;
  String? media;
  String? cpu;
  String? releaseDate;

  Results(
      {this.id,
        this.name,
        this.developer,
        this.generation,
        this.media,
        this.cpu,
        this.releaseDate});

  Results.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    developer = json['developer'];
    generation = json['generation'];
    media = json['media'];
    cpu = json['cpu'];
    releaseDate = json['release_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['developer'] = this.developer;
    data['generation'] = this.generation;
    data['media'] = this.media;
    data['cpu'] = this.cpu;
    data['release_date'] = this.releaseDate;
    return data;
  }
}
