class GameModel {
  int? count;
  String? next;
  Null? previous;
  List<Results>? results;

  GameModel({this.count, this.next, this.previous, this.results});

  GameModel.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(Results.fromJson(v));
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
  String? title;
  String? description;
  String? cover;
  String? developer;
  String? publisher;
  List<String>? director;
  List<String>? genre;
  List<String>? platform;
  String? releaseDate;

  Results(
      {this.id,
      this.title,
      this.description,
      this.cover,
      this.developer,
      this.publisher,
      this.director,
      this.genre,
      this.platform,
      this.releaseDate});

  Results.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    cover = json['cover'];
    developer = json['developer'];
    publisher = json['publisher'];
    director = json['director'].cast<String>();
    genre = json['genre'].cast<String>();
    platform = json['platform'].cast<String>();
    releaseDate = json['release_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['cover'] = this.cover;
    data['developer'] = this.developer;
    data['publisher'] = this.publisher;
    data['director'] = this.director;
    data['genre'] = this.genre;
    data['platform'] = this.platform;
    data['release_date'] = this.releaseDate;
    return data;
  }
}
