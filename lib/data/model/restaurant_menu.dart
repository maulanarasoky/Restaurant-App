class RestaurantMenu {
  final List<Food> foods;
  final List<Drink> drinks;

  RestaurantMenu({required this.foods, required this.drinks});

  factory RestaurantMenu.fromJson(Map<String, dynamic> json) {
    return RestaurantMenu(
      foods: json["foods"] != null
          ? List<Food>.from(json["foods"].map((x) => Food.fromJson(x)))
          : <Food>[],

      drinks: json["drinks"] != null
          ? List<Drink>.from(json["drinks"].map((x) => Drink.fromJson(x)))
          : <Drink>[],
    );
  }
}

class Food {
  final String name;

  Food({required this.name});

  factory Food.fromJson(Map<String, dynamic> json) {
    return Food(name: json["name"]);
  }
}

class Drink {
  final String name;

  Drink({required this.name});

  factory Drink.fromJson(Map<String, dynamic> json) {
    return Drink(name: json["name"]);
  }
}
