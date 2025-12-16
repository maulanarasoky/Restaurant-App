import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:restaurant_app/data/model/restaurant_detail.dart';
import 'package:restaurant_app/data/model/restaurant_menu.dart';
import 'package:restaurant_app/style/colors/restaurant_colors.dart';
import 'package:restaurant_app/style/theme/restaurant_theme.dart';

class BodyOfDetailScreenWidget extends StatelessWidget {
  const BodyOfDetailScreenWidget({super.key, required this.restaurant});

  final RestaurantDetail restaurant;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    restaurant.name,
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    "${restaurant.address}, ${restaurant.city}",
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox.square(dimension: 4),
            Row(
              children: [
                StarRating(
                  rating: restaurant.rating.toDouble(),
                  color: Colors.orange,
                ),
                const SizedBox.square(dimension: 8),
                Text(
                  restaurant.rating.toString(),
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
            const SizedBox.square(dimension: 16),
            Text(
              restaurant.description,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox.square(dimension: 16),
            _buildFoods(context, restaurant.restaurantMenus),
            _buildDrinks(context, restaurant.restaurantMenus),
          ],
        ),
      ),
    );
  }
}

Widget _buildFoods(BuildContext context, RestaurantMenu restaurantMenu) {
  if (restaurantMenu.foods.isEmpty) {
    return const SizedBox.shrink();
  }

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SizedBox.square(dimension: 16),
      Text(
        "Foods",
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
          fontWeight: FontWeight.w600
        ),
        textAlign: TextAlign.start,
      ),
      const SizedBox.square(dimension: 4),
      SizedBox(
        height: 40,
        child: ListView.builder(
          itemCount: restaurantMenu.foods.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final food = restaurantMenu.foods[index];
            return Row(
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: RestaurantColors.pastelBlue.color,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(food.name, style: RestaurantTheme.textChipStyle),
                ),
                const SizedBox.square(dimension: 8),
              ],
            );
          },
        ),
      ),
    ],
  );
}

Widget _buildDrinks(BuildContext context, RestaurantMenu restaurantMenu) {
  if (restaurantMenu.drinks.isEmpty) {
    return const SizedBox.shrink();
  }

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SizedBox.square(dimension: 16),
      Text(
        "Drinks",
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
          fontWeight: FontWeight.w600,
        ),
        textAlign: TextAlign.start,
      ),
      const SizedBox.square(dimension: 4),
      SizedBox(
        height: 40,
        child: ListView.builder(
          itemCount: restaurantMenu.drinks.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final food = restaurantMenu.drinks[index];
            return Row(
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: RestaurantColors.pastelBlue.color,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(food.name, style: RestaurantTheme.textChipStyle),
                ),
                const SizedBox.square(dimension: 8),
              ],
            );
          },
        ),
      ),
    ],
  );
}
