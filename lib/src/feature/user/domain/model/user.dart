class User {
  int id;
  String name;
  int level;
  String username;
  String password;
  DateTime? createdAt;
  DateTime? updatedAt;

  User({
    this.id = 0,
    this.name = "",
    this.level = 0,
    this.username = "",
    this.password = "",
    this.createdAt,
    this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json["id"] as int,
      name: json["name"] as String,
      level: json["level"] as int,
      username: json["username"] as String,
      password: json["password"] as String,
      createdAt: json["createdAt"] as DateTime,
      updatedAt: json["updatedAt"] as DateTime,
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "levle": level,
        "username": username,
        "password": password,
        "created_at": createdAt!.toUtc().millisecondsSinceEpoch,
        "updated_at": updatedAt!.toUtc().millisecondsSinceEpoch,
      };
}
