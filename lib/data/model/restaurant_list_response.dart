import 'package:restaurant_app/data/model/restaurant.dart';

class RestaurantListResponse {
  final bool error;
  final String message;
  final String count;
  final List<Restaurant> places;

  RestaurantListResponse({
    required this.error,
    required this.message,
    required this.count,
    required this.places,
  });

  factory RestaurantListResponse.fromJson(Map<String, dynamic> json) {
    return RestaurantListResponse(
      error: json["error"],
      message: json["message"],
      count: json["count"],
      places: json["restaurants"] != null
          ? List<Restaurant>.from(
              json["restaurants"].map((x) => Restaurant.fromJson(x)),
            )
          : <Restaurant>[],
    );
  }
}
