import 'dart:convert';

class User {
  final String id;
  final String name;
  final String username;
  final int age;
  final String country;
  final DateTime createdAt;

  User({
    required this.id,
    required this.name,
    required this.username,
    required this.age,
    required this.country,
    required this.createdAt,
  });

  User copyWith({
    String? id,
    String? name,
    String? username,
    int? age,
    String? country,
    DateTime? createdAt,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      username: username ?? this.username,
      age: age ?? this.age,
      country: country ?? this.country,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'username': username,
      'age': age,
      'country': country,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as String,
      name: map['name'] as String,
      username: map['username'] as String,
      age: map['age'] as int,
      country: map['country'] as String,
      createdAt: DateTime.parse(map['createdAt'] as String),
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));
}