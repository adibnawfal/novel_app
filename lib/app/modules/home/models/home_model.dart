class HomeModel {
  int? id;
  String? title;
  String? author;
  String? genre;
  num? ratings;
  String? summary;
  Cover? cover;

  HomeModel({
    this.id,
    this.title,
    this.author,
    this.genre,
    this.ratings,
    this.summary,
    this.cover,
  });

  HomeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    author = json['author'];
    genre = json['genre'];
    ratings = json['ratings'];
    summary = json['summary'];
    cover = json['cover'] != null ? Cover.fromJson(json['cover']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['author'] = author;
    data['genre'] = genre;
    data['ratings'] = ratings;
    data['summary'] = summary;
    if (cover != null) {
      data['cover'] = cover!.toJson();
    }
    return data;
  }
}

class Cover {
  int? id;
  String? name;
  String? ext;
  String? mime;
  num? size;
  String? url;
  String? folderPath;

  Cover({
    this.id,
    this.name,
    this.ext,
    this.mime,
    this.size,
    this.url,
    this.folderPath,
  });

  Cover.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    ext = json['ext'];
    mime = json['mime'];
    size = json['size'];
    url = json['url'];
    folderPath = json['folderPath'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['ext'] = ext;
    data['mime'] = mime;
    data['size'] = size;
    data['url'] = url;
    data['folderPath'] = folderPath;
    return data;
  }
}
