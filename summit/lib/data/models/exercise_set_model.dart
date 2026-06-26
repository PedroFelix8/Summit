class ExerciseSetModel {
  const ExerciseSetModel({
    this.id,
    required this.exerciseId,
    required this.setNumber,
    required this.repetitions,
    this.weight,
  });

  final int? id;
  final int exerciseId;
  final int setNumber;
  final int repetitions;
  final double? weight;

  factory ExerciseSetModel.fromJson(Map<String, dynamic> json) {
    return ExerciseSetModel(
      id: json['id'] as int?,
      exerciseId: json['exerciseId'] as int,
      setNumber: json['setNumber'] as int,
      repetitions: json['repetitions'] as int,
      weight: (json['weight'] as num?)?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'exerciseId': exerciseId,
      'setNumber': setNumber,
      'repetitions': repetitions,
      'weight': weight,
    };
  }

  ExerciseSetModel copyWith({
    int? id,
    int? exerciseId,
    int? setNumber,
    int? repetitions,
    double? weight,
  }) {
    return ExerciseSetModel(
      id: id ?? this.id,
      exerciseId: exerciseId ?? this.exerciseId,
      setNumber: setNumber ?? this.setNumber,
      repetitions: repetitions ?? this.repetitions,
      weight: weight ?? this.weight,
    );
  }
}
