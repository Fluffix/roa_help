class PharmaciesSerialise {
  List<Pharmacy> pharmacies;

  PharmaciesSerialise({this.pharmacies});

  PharmaciesSerialise.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      pharmacies = [];
      json['items'].forEach((pharmacy) {
        pharmacies.add(new Pharmacy.fromJson(pharmacy));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.pharmacies != null) {
      data['items'] =
          this.pharmacies.map((pharmacy) => pharmacy.toJson()).toList();
    }
    return data;
  }
}

class Pharmacy {
  int id;
  String name;
  double fat;
  bool inFavorites;

  Pharmacy({this.id, this.name, this.fat, this.inFavorites});

  Pharmacy.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    fat = json['fat'];
    inFavorites = json['in_favorites'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['fat'] = this.fat;
    data['in_favorites'] = this.inFavorites;
    return data;
  }
}
