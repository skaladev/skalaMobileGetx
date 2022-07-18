import 'dart:convert';

class KonsultasiDummy{
  late String title;
  late String description;
  late String date;

  KonsultasiDummy({
    required this.title,
    required this.description,
    required this.date
  });

  KonsultasiDummy.fromJson(Map<String,dynamic> konsultasi){
    print("===========Konsultasi============");
    title = konsultasi['title'];
    description = konsultasi['description'];
    date = konsultasi['date'];
  }
}

List<KonsultasiDummy> parseKonsultasi(String? json){
  if(json == null){
    return [];
  }
  final List parsed = jsonDecode(json);
  return parsed.map((json) => KonsultasiDummy.fromJson(json)).toList();
}