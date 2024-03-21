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
      createdAt: json["createdAt"] as DateTime,
      updatedAt: json["updatedAt"] as DateTime,
    );
  }
}
