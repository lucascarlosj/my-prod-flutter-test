// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserEntity {
  final String avatarUrl;
  final String name;
  final String bio;

  UserEntity({
    required this.avatarUrl,
    required this.name,
    required this.bio,
  });

  factory UserEntity.empty() {
    return UserEntity(
      avatarUrl: '',
      name: '',
      bio: '',
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'avatarUrl': avatarUrl,
      'name': name,
      'bio': bio,
    };
  }

  factory UserEntity.fromMap(Map<String, dynamic> map) {
    return UserEntity(
      avatarUrl: map['avatar_url'] as String? ?? '',
      name: map['name'] as String? ?? '',
      bio: map['bio'] as String? ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserEntity.fromJson(String source) =>
      UserEntity.fromMap(json.decode(source) as Map<String, dynamic>);
}
