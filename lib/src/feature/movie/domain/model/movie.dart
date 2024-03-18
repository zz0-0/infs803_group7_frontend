class Movie {
  int id;
  String name;
  DateTime? createdAt;
  DateTime? updatedAt;

  Movie({
    required this.id,
    required this.name,
    this.createdAt,
    this.updatedAt,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'id': final int id,
        'name': final String name,
      } =>
        Movie(
          id: id,
          name: name,
        ),
      _ => throw const FormatException("Failed to load Movie"),
    };
  }
}
