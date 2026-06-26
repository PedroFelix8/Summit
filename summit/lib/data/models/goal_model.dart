class GoalModel {
  const GoalModel({
    this.id,
    required this.userId,
    required this.title,
    required this.targetValue,
    this.currentValue = 0,
    this.deadline,
  });

  final int? id;
  final int userId;
  final String title;
  final double targetValue;
  final double currentValue;
  final DateTime? deadline;

  factory GoalModel.fromJson(Map<String, dynamic> json) {
    return GoalModel(
      id: json['id'] as int?,
      userId: json['userId'] as int,
      title: json['title'] as String,
      targetValue: (json['targetValue'] as num).toDouble(),
      currentValue: (json['currentValue'] as num?)?.toDouble() ?? 0,
      deadline: json['deadline'] == null
          ? null
          : DateTime.parse(json['deadline'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'title': title,
      'targetValue': targetValue,
      'currentValue': currentValue,
      'deadline': deadline?.toIso8601String(),
    };
  }

  GoalModel copyWith({
    int? id,
    int? userId,
    String? title,
    double? targetValue,
    double? currentValue,
    DateTime? deadline,
  }) {
    return GoalModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      title: title ?? this.title,
      targetValue: targetValue ?? this.targetValue,
      currentValue: currentValue ?? this.currentValue,
      deadline: deadline ?? this.deadline,
    );
  }
}
