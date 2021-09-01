class ProfileInfoSerialise {
  int id;
  String username;
  int waterDayNorm;
  Extra extra;

  ProfileInfoSerialise({this.id, this.username, this.extra, this.waterDayNorm});

  ProfileInfoSerialise.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    extra = json['extra'] != null ? new Extra.fromJson(json['extra']) : null;
    waterDayNorm = json['waternorm'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    if (this.extra != null) {
      data['extra'] = this.extra.toJson();
    }
    data['waternorm'] = this.waterDayNorm;
    return data;
  }
}

class Extra {
  String city;

  Extra({this.city});

  Extra.fromJson(Map<String, dynamic> json) {
    city = json['city'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['city'] = this.city;

    return data;
  }
}
