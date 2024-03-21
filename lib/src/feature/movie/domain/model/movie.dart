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
    return Movie(
      id: json["id"] as int,
      name: json["name"] as String,
      createdAt: json["createdAt"] as DateTime,
      updatedAt: json["updatedAt"] as DateTime,
    );
  }

  // factory Movie.toJson(Movie movie) {}
}
