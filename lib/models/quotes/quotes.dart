class Quotes {
  List<Quotes1>? quotes;
  int? total;
  int? skip;
  int? limit;

  Quotes({this.quotes, this.total, this.skip, this.limit});

  Quotes.fromJson(Map<String, dynamic> json) {
    if (json["quotes"] is List) {
      quotes = json["quotes"] == null
          ? null
          : (json["quotes"] as List).map((e) => Quotes1.fromJson(e)).toList();
    }
    if (json["total"] is int) {
      total = json["total"];
    }
    if (json["skip"] is int) {
      skip = json["skip"];
    }
    if (json["limit"] is int) {
      limit = json["limit"];
    }
  }

  static List<Quotes> fromList(List<Map<String, dynamic>> list) {
    return list.map(Quotes.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (quotes != null) {
      data["quotes"] = quotes?.map((e) => e.toJson()).toList();
    }
    data["total"] = total;
    data["skip"] = skip;
    data["limit"] = limit;
    return data;
  }
}

class Quotes1 {
  int? id;
  String? quote;
  String? author;

  Quotes1({this.id, this.quote, this.author});

  Quotes1.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) {
      id = json["id"];
    }
    if (json["quote"] is String) {
      quote = json["quote"];
    }
    if (json["author"] is String) {
      author = json["author"];
    }
  }

  static List<Quotes1> fromList(List<Map<String, dynamic>> list) {
    return list.map(Quotes1.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["quote"] = quote;
    data["author"] = author;
    return data;
  }
}
