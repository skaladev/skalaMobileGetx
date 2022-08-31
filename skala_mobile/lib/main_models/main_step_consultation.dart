import 'dart:convert';

class StepConsultation {
  late String id;
  late String title;
  late String description;

  StepConsultation({
    required this.id,
    required this.title,
    required this.description,
  });

  StepConsultation.fromJson(Map<String, dynamic> step) {
    print("==========================");
    id = step['id'];
    title= step['title'];
    description = step['description'];
  }
}

List< StepConsultation> parseSteps(String? json) {
  if (json == null) {
    return [];
  }
  final List parsed = jsonDecode(json);
  return parsed.map((json) => StepConsultation.fromJson(json)).toList();
}
