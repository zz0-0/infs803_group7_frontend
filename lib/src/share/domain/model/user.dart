class User {
  int id;
  String name;
  int level;
  String username;
  String password;
  // String token;
  DateTime? createdAt;
  DateTime? updatedAt;

  User({
    this.id = 0,
    this.name = "",
    this.username = "",
    this.password = "",
    // this.token = "",
    this.level = 1,
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
      // token: json["token"] as String,
      createdAt: DateTime.fromMicrosecondsSinceEpoch(
        int.parse(json["created_at"] as String),
      ),
      updatedAt: DateTime.fromMicrosecondsSinceEpoch(
        int.parse(json["updated_at"] as String),
      ),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "level": level,
        "username": name,
        "password": name,
        "created_at": createdAt!.toUtc().millisecondsSinceEpoch,
        "updated_at": updatedAt!.toUtc().millisecondsSinceEpoch,
      };

  @override
  String toString() {
    return "$id, $name, $level, $username, $password, $createdAt, $updatedAt";
  }
}
