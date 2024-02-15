class Country {
  final int id;
  final String countryName;
  final String flag;
  final int population;
  final String region;
  final String backdropImage;
  final String capital;
  final String overview;

  Country({
    required this.id,
    required this.countryName,
    required this.flag,
    required this.population,
    required this.region,
    required this.backdropImage,
    required this.capital,
    required this.overview,
  });

  Country.fromMap(Map<String, dynamic> item)
      : id = item["id"],
        countryName = item["countryName"],
        flag = item["flag"],
        population = item["population"],
        region = item["region"],
        backdropImage = item["backdropImage"],
        capital = item["capital"],
        overview = item["overview"];

  Map<String, Object> toMap() {
    return {
      "id": id,
      "countryName": countryName,
      "flag": flag,
      "population": population,
      "region": region,
      "backdropImage": backdropImage,
      "capital": capital,
      "overview": overview
    };
  }
}
