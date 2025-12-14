import 'package:restaurant_app/data/model/restaurant.dart';

class RestaurantDetailResponse {
  final bool error;
  final String message;
  final Restaurant details;

  RestaurantDetailResponse({
    required this.error,
    required this.message,
    required this.details,
  });

  factory RestaurantDetailResponse.fromJson(Map<String, dynamic> json) {
    return RestaurantDetailResponse(
      error: json["error"],
      message: json["message"],
      details: Restaurant.fromJson(json["restaurant"]),
    );
  }
}
