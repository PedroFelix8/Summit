class EnduranceActivityModel {
  const EnduranceActivityModel({
    this.id,
    required this.workoutId,
    required this.sport,
    this.distance,
    this.pace,
    this.elevation,
  });

  final int? id;
  final int workoutId;
  final String sport;
  final double? distance;
  final double? pace;
  final double? elevation;

  factory EnduranceActivityModel.fromJson(Map<String, dynamic> json) {
    return EnduranceActivityModel(
      id: json['id'] as int?,
      workoutId: json['workoutId'] as int,
      sport: json['sport'] as String,
      distance: (json['distance'] as num?)?.toDouble(),
      pace: (json['pace'] as num?)?.toDouble(),
      elevation: (json['elevation'] as num?)?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'workoutId': workoutId,
      'sport': sport,
      'distance': distance,
      'pace': pace,
      'elevation': elevation,
    };
  }

  EnduranceActivityModel copyWith({
    int? id,
    int? workoutId,
    String? sport,
    double? distance,
    double? pace,
    double? elevation,
  }) {
    return EnduranceActivityModel(
      id: id ?? this.id,
      workoutId: workoutId ?? this.workoutId,
      sport: sport ?? this.sport,
      distance: distance ?? this.distance,
      pace: pace ?? this.pace,
      elevation: elevation ?? this.elevation,
    );
  }
}
