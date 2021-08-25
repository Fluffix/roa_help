class StatsSerialise {
  int water;
  String date;
  List<Notes> notes;

  StatsSerialise({this.water, this.date, this.notes});

  StatsSerialise.fromJson(Map<String, dynamic> json) {
    water = json['water'];
    date = json['date'];
    if (json['notes'] != null) {
      json['notes'].forEach((v) {
        notes.add(new Notes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['water'] = this.water;
    data['date'] = this.date;
    if (this.notes != null) {
      data['notes'] = this.notes.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Notes {
  int id;
  int statsId;
  String category;
  String comment;

  Notes({this.id, this.statsId, this.category, this.comment});

  Notes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    statsId = json['stats_id'];
    category = json['category'];
    comment = json['comment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['stats_id'] = this.statsId;
    data['category'] = this.category;
    data['comment'] = this.comment;
    return data;
  }
}
