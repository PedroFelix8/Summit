class UserModel {
  const UserModel({
    this.id,
    required this.name,
    this.preferredSports,
  });

  final int? id;
  final String name;
  final String? preferredSports;

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as int?,
      name: json['name'] as String,
      preferredSports: json['preferredSports'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'preferredSports': preferredSports,
    };
  }

  UserModel copyWith({
    int? id,
    String? name,
    String? preferredSports,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      preferredSports: preferredSports ?? this.preferredSports,
    );
  }
}
