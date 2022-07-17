import 'dart:convert';
class KegiatanLainArticle{
  late String author;
  late String title;
  late String description;
  late String url;
  late String urlToImage;
  late String publishedAt;
  late String content;

  KegiatanLainArticle({
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  KegiatanLainArticle.fromJson(Map<String, dynamic> article) {
    print("==========================");
    author = article['author'];
    title = article['title'];
    description = article['description'];
    url = article['url'];
    urlToImage = article['urlToImage'];
    publishedAt = article['publishedAt'];
    content = article['content'];
  }
}

List<KegiatanLainArticle> parseKegiatanLain(String? json) {
  if (json == null) {
    return [];
  }
  final List parsed = jsonDecode(json);
  return parsed.map((json) => KegiatanLainArticle.fromJson(json)).toList();
}
