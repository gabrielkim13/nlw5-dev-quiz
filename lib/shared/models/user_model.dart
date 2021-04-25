import 'dart:convert';

class UserModel {
  final String name;

  final String avatarUrl;

  final double score;

  UserModel({required this.name, required this.avatarUrl, this.score = 0});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'avatarUrl': avatarUrl,
      'score': score,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'],
      avatarUrl: map['avatarUrl'],
      score: map['score'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}
