// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class StarredEntity {
  final String? fullName;
  final String? description;
  final int? forksCount;
  final int? stargazersCount;

  StarredEntity({
    required this.fullName,
    required this.description,
    required this.forksCount,
    required this.stargazersCount,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'fullName': fullName,
      'description': description,
      'forksCount': forksCount,
      'stargazersCount': stargazersCount,
    };
  }

  factory StarredEntity.fromMap(Map<String, dynamic> map) {
    return StarredEntity(
      fullName: map['full_name'] as String? ?? '',
      description: map['description'] as String? ?? '',
      forksCount: map['forks_count'] as int? ?? 0,
      stargazersCount: map['stargazers_count'] as int? ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory StarredEntity.fromJson(String source) =>
      StarredEntity.fromMap(json.decode(source) as Map<String, dynamic>);
}
