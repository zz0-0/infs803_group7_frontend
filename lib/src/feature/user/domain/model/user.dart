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
}
