import 'dart:convert';

class Habit {
  final String id;
  final String name;
  final String description;
  final String frequency;
  final int color;
  final bool notifyEnabled;
  final List<String> notificationTimes;
  final DateTime createdAt;
  final DateTime? completedAt;

  Habit({
    required this.id,
    required this.name,
    required this.description,
    required this.frequency,
    required this.color,
    required this.notifyEnabled,
    required this.notificationTimes,
    required this.createdAt,
    this.completedAt,
  });

  bool get isCompleted => completedAt != null;

  Habit copyWith({
    String? id,
    String? name,
    String? description,
    String? frequency,
    int? color,
    bool? notifyEnabled,
    List<String>? notificationTimes,
    DateTime? createdAt,
    DateTime? completedAt,
  }) {
    return Habit(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      frequency: frequency ?? this.frequency,
      color: color ?? this.color,
      notifyEnabled: notifyEnabled ?? this.notifyEnabled,
      notificationTimes: notificationTimes ?? this.notificationTimes,
      createdAt: createdAt ?? this.createdAt,
      completedAt: completedAt ?? this.completedAt,
    );
  }

  Habit markCompleted() {
    return copyWith(completedAt: DateTime.now());
  }

  Habit markIncomplete() {
    return Habit(
      id: id,
      name: name,
      description: description,
      frequency: frequency,
      color: color,
      notifyEnabled: notifyEnabled,
      notificationTimes: notificationTimes,
      createdAt: createdAt,
      completedAt: null,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'frequency': frequency,
      'color': color,
      'notifyEnabled': notifyEnabled,
      'notificationTimes': notificationTimes,
      'createdAt': createdAt.toIso8601String(),
      'completedAt': completedAt?.toIso8601String(),
    };
  }

  factory Habit.fromMap(Map<String, dynamic> map) {
    return Habit(
      id: map['id'] as String,
      name: map['name'] as String,
      description: map['description'] as String,
      frequency: map['frequency'] as String,
      color: map['color'] as int,
      notifyEnabled: map['notifyEnabled'] as bool,
      notificationTimes: List<String>.from(map['notificationTimes'] as List),
      createdAt: DateTime.parse(map['createdAt'] as String),
      completedAt: map['completedAt'] != null
          ? DateTime.parse(map['completedAt'] as String)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Habit.fromJson(String source) => Habit.fromMap(json.decode(source));
}