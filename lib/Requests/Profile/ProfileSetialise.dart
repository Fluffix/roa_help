class ProfileInfo {
  int id;
  String username;
  Extra extra;

  ProfileInfo({this.id, this.username, this.extra});

  ProfileInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    extra = json['extra'] != null ? new Extra.fromJson(json['extra']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    if (this.extra != null) {
      data['extra'] = this.extra.toJson();
    }
    return data;
  }
}

class Extra {
  String city;
  int waterDayNorm;

  Extra({this.city, this.waterDayNorm});

  Extra.fromJson(Map<String, dynamic> json) {
    city = json['city'];
    waterDayNorm = json['waterDayNorm'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['city'] = this.city;
    data['waterDayNorm'] = this.waterDayNorm;
    return data;
  }
}
