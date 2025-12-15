import 'package:restaurant_app/data/model/restaurant.dart';

class RestaurantSearchResponse {
  final bool error;
  final num founded;
  final List<Restaurant> restaurant;

  RestaurantSearchResponse({
    required this.error,
    required this.founded,
    required this.restaurant,
  });

  factory RestaurantSearchResponse.fromJson(Map<String, dynamic> json) {
    return RestaurantSearchResponse(
      error: json["error"],
      founded: json["founded"],
      restaurant: json["restaurants"] != null
          ? List<Restaurant>.from(
        json["restaurants"].map((x) => Restaurant.fromJson(x)),
      )
          : <Restaurant>[],
    );
  }
}
