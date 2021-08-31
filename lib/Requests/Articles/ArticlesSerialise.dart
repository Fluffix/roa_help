class ArticlesSerialise {
  List<Article> articles;

  ArticlesSerialise({this.articles});

  ArticlesSerialise.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      articles = [];
      json['items'].forEach((v) {
        articles.add(new Article.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.articles != null) {
      data['items'] = this.articles.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Article {
  int id;
  String header;
  String summary;
  String thumbnail;
  String link;

  Article({this.id, this.header, this.summary, this.thumbnail, this.link});

  Article.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    header = json['header'];
    summary = json['summary'];
    thumbnail = json['thumbnail'];
    link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['header'] = this.header;
    data['summary'] = this.summary;
    data['thumbnail'] = this.thumbnail;
    data['link'] = this.link;
    return data;
  }
}
