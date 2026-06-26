class WorkoutModel {
  const WorkoutModel({
    this.id,
    required this.userId,
    required this.date,
    required this.duration,
    required this.type,
    this.notes,
  });

  final int? id;
  final int userId;
  final DateTime date;
  final int duration;
  final String type;
  final String? notes;

  factory WorkoutModel.fromJson(Map<String, dynamic> json) {
    return WorkoutModel(
      id: json['id'] as int?,
      userId: json['userId'] as int,
      date: DateTime.parse(json['date'] as String),
      duration: json['duration'] as int,
      type: json['type'] as String,
      notes: json['notes'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'date': date.toIso8601String(),
      'duration': duration,
      'type': type,
      'notes': notes,
    };
  }

  WorkoutModel copyWith({
    int? id,
    int? userId,
    DateTime? date,
    int? duration,
    String? type,
    String? notes,
  }) {
    return WorkoutModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      date: date ?? this.date,
      duration: duration ?? this.duration,
      type: type ?? this.type,
      notes: notes ?? this.notes,
    );
  }
}
