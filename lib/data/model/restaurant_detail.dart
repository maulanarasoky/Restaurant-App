import 'package:restaurant_app/data/model/restaurant_menu.dart';

class RestaurantDetail {
  final String id;
  final String name;
  final String description;
  final String picture;
  final String city;
  final String address;
  final num rating;
  final List<Category> categories;
  final RestaurantMenu restaurantMenus;
  final List<CustomerReview> customerReviews;

  RestaurantDetail({
    required this.id,
    required this.name,
    required this.description,
    required this.picture,
    required this.city,
    required this.address,
    required this.rating,
    required this.categories,
    required this.restaurantMenus,
    required this.customerReviews,
  });

  factory RestaurantDetail.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
      "id": String id,
      "name": String name,
      "description": String description,
      "pictureId": String pictureId,
      "city": String city,
      "address": String address,
      "rating": num rating,
      } =>
          RestaurantDetail(
            id: id,
            name: name,
            description: description,
            picture:
            "https://restaurant-api.dicoding.dev/images/large/$pictureId",
            city: city,
            address: address,
            rating: rating,
            categories: json["categories"] != null
                ? List<Category>.from(
              json["categories"].map((x) => Category.fromJson(x)),
            )
                : <Category>[],
            restaurantMenus: RestaurantMenu.fromJson(json["menus"]),
            customerReviews: json["customerReviews"] != null
                ? List<CustomerReview>.from(
              json["customerReviews"].map(
                    (x) => CustomerReview.fromJson(x),
              ),
            )
                : <CustomerReview>[],
          ),
      _ => throw const FormatException('failed to load restaurant data'),
    };
  }
}

class Category {
  final String name;

  Category({required this.name});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(name: json["name"]);
  }
}

class CustomerReview {
  final String name;
  final String review;
  final String date;

  CustomerReview({
    required this.name,
    required this.review,
    required this.date,
  });

  factory CustomerReview.fromJson(Map<String, dynamic> json) {
    return CustomerReview(
      name: json["name"],
      review: json["review"],
      date: json["date"],
    );
  }
}
