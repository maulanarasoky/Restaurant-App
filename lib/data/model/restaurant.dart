class Restaurant {
  final String id;
  final String name;
  final String description;
  final String picture;
  final String city;
  final double rating;

  Restaurant({
    required this.id,
    required this.name,
    required this.description,
    required this.picture,
    required this.city,
    required this.rating,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        "id": String id,
        "name": String name,
        "description": String description,
        "pictureId": String pictureId,
        "city": String city,
        "rating": double rating,
      } =>
        Restaurant(
          id: id,
          name: name,
          description: description,
          picture:
              "https://restaurant-api.dicoding.dev/images/large/$pictureId",
          city: city,
          rating: rating,
        ),
      _ => throw const FormatException('failed to load restaurant data'),
    };
  }
}
