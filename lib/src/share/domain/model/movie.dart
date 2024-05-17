class Movie {
  double? budgetX;
  String? country;
  String? crew;
  String? dateX;
  String? genre;
  String? names;
  String? origLang;
  String? origTitle;
  String? overview;
  double? revenue;
  int? score;
  // String? status;

  Movie({
    this.budgetX,
    this.country,
    this.crew,
    this.dateX,
    this.genre,
    this.names,
    this.origLang,
    this.origTitle,
    this.overview,
    this.revenue,
    this.score,
    // this.status,
  });

  Movie.fromJson(Map<String, dynamic> json) {
    budgetX = json['budget_x'] as double;
    country = json['country'] as String;
    crew = json['crew'] as String;
    dateX = json['date_x'] as String;
    genre = json['genre'] as String;
    names = json['names'] as String;
    origLang = json['orig_lang'] as String;
    origTitle = json['orig_title'] as String;
    overview = json['overview'] as String;
    revenue = json['revenue'] as double;
    score = json['score'] as int;
    // status = json['status'] as String;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['budget_x'] = budgetX;
    data['country'] = country;
    data['crew'] = crew;
    data['date_x'] = dateX;
    data['genre'] = genre;
    data['names'] = names;
    data['orig_lang'] = origLang;
    data['orig_title'] = origTitle;
    data['overview'] = overview;
    data['revenue'] = revenue;
    data['score'] = score;
    // data['status'] = status;
    return data;
  }
}
