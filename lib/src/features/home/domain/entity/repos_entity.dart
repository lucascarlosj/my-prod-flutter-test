import 'dart:convert';

class ReposEntity {
  final String? name;
  final int? forksCount;
  final String? language;
  final String? description;
  ReposEntity({
    required this.name,
    required this.forksCount,
    required this.language,
    required this.description,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'forksCount': forksCount,
      'language': language,
      'description': description,
    };
  }

  factory ReposEntity.fromMap(Map<String, dynamic> map) {
    return ReposEntity(
      name: map['name'] as String? ?? '',
      forksCount: map['forks_count'] as int? ?? 0,
      language: map['language'] as String? ?? '',
      description: map['description'] as String? ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ReposEntity.fromJson(String source) =>
      ReposEntity.fromMap(json.decode(source) as Map<String, dynamic>);
}
