class StrengthExerciseModel {
  const StrengthExerciseModel({
    this.id,
    required this.workoutId,
    required this.name,
    this.muscleGroup,
  });

  final int? id;
  final int workoutId;
  final String name;
  final String? muscleGroup;

  factory StrengthExerciseModel.fromJson(Map<String, dynamic> json) {
    return StrengthExerciseModel(
      id: json['id'] as int?,
      workoutId: json['workoutId'] as int,
      name: json['name'] as String,
      muscleGroup: json['muscleGroup'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'workoutId': workoutId,
      'name': name,
      'muscleGroup': muscleGroup,
    };
  }

  StrengthExerciseModel copyWith({
    int? id,
    int? workoutId,
    String? name,
    String? muscleGroup,
  }) {
    return StrengthExerciseModel(
      id: id ?? this.id,
      workoutId: workoutId ?? this.workoutId,
      name: name ?? this.name,
      muscleGroup: muscleGroup ?? this.muscleGroup,
    );
  }
}
