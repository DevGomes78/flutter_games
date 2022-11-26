class ScreenGames {
  int? count;
  Null? next;
  Null? previous;
  List<Results>? results;

  ScreenGames({this.count, this.next, this.previous, this.results});

  ScreenGames.fromJson(Map<String, dynamic> json) {
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    data['next'] = next;
    data['previous'] = previous;
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  int? id;
  String? game;
  String? screenshot1;
  String? screenshot2;
  String? screenshot3;
  String? screenshot4;

  Results(
      {this.id,
        this.game,
        this.screenshot1,
        this.screenshot2,
        this.screenshot3,
        this.screenshot4});

  Results.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    game = json['game'];
    screenshot1 = json['screenshot_1'];
    screenshot2 = json['screenshot_2'];
    screenshot3 = json['screenshot_3'];
    screenshot4 = json['screenshot_4'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['game'] = this.game;
    data['screenshot_1'] = this.screenshot1;
    data['screenshot_2'] = this.screenshot2;
    data['screenshot_3'] = this.screenshot3;
    data['screenshot_4'] = this.screenshot4;
    return data;
  }
}
