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
        'created_at': final DateTime createdAt,
        'updated_at': final DateTime updatedAt,
      } =>
        Movie(
          id: id,
          name: name,
          createdAt: createdAt,
          updatedAt: updatedAt,
        ),
      _ => throw const FormatException("Failed to load Movie"),
    };
  }

  // factory Movie.toJson(Movie movie) {}
}
