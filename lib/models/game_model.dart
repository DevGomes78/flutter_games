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

    platform = json['platform'].cast<String>();
    releaseDate = json['release_date'];
  }
}
