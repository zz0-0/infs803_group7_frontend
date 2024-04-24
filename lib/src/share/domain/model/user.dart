class User {
  int id;
  String name;
  int level;
  String username;
  String password;
  // String token;
  bool deleted;
  DateTime? createdAt;
  DateTime? updatedAt;

  User({
    this.id = 0,
    this.name = "",
    this.username = "",
    this.password = "",
    // this.token = "",
    this.level = 1,
    this.deleted = false,
    this.createdAt,
    this.updatedAt,
  });

  // User.empty() {
  //   final int id = 0;
  //   final String name = "";
  //   final String username = "";
  //   final String password = "";

  //   final int level = 1;
  //   final bool deleted = false;
  //   final DateTime createdAt = DateTime.fromMicrosecondsSinceEpoch(0);
  //   final DateTime updatedAt = DateTime.fromMicrosecondsSinceEpoch(0);
  // }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json["id"] as int,
      name: json["name"] as String,
      level: json["level"] as int,
      username: json["username"] as String,
      password: json["password"] as String,
      deleted: bool.parse(json["deleted"].toString()),
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
        "username": username,
        "password": password,
        "deleted": deleted,
        "created_at": createdAt!.toUtc().millisecondsSinceEpoch.toString(),
        "updated_at": updatedAt!.toUtc().millisecondsSinceEpoch.toString(),
      };

  @override
  String toString() {
    return "$id, $name, $level, $username, $password, $deleted, $createdAt, $updatedAt";
  }
}
