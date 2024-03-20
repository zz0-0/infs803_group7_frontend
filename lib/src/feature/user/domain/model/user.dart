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
    return switch (json) {
      {
        'id': final int id,
        'name': final String name,
        'created_at': final DateTime createdAt,
        'updated_at': final DateTime updatedAt,
      } =>
        User(
          id: id,
          name: name,
          createdAt: createdAt,
          updatedAt: updatedAt,
        ),
      _ => throw const FormatException("Failed to load User"),
    };
  }
}
