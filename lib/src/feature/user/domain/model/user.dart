class User {
  int id;
  String name;
  int level;
  DateTime? createdAt;
  DateTime? updatedAt;

  User({
    required this.id,
    required this.name,
    this.level = 1,
    this.createdAt,
    this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json["id"] as int,
      name: json["name"] as String,
      level: json["level"] as int,
      createdAt: DateTime.fromMicrosecondsSinceEpoch(json["created_at"] as int),
      updatedAt: DateTime.fromMicrosecondsSinceEpoch(json["updated_at"] as int),
    );
  }

  @override
  String toString() {
    return "$id, $name, $level, $createdAt, $updatedAt";
  }
}
