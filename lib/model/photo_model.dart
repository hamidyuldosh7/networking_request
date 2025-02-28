
class PhotoModel {
  int? albumId;
  int id;
  String title;
  String url;
  String thumbnailUrl;
  int? albomIdentifikatori;

  PhotoModel({
    this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
    this.albomIdentifikatori,
  });

  factory PhotoModel.fromJson(Map<String, dynamic> json) => PhotoModel(
    albumId: json["albumId"],
    id: json["id"],
    title: json["title"],
    url: json["url"],
    thumbnailUrl: json["thumbnailUrl"],
    albomIdentifikatori: json["albom identifikatori"],
  );

  Map<String, dynamic> toJson() => {
    "albumId": albumId,
    "id": id,
    "title": title,
    "url": url,
    "thumbnailUrl": thumbnailUrl,
    "albom identifikatori": albomIdentifikatori,
  };
}
