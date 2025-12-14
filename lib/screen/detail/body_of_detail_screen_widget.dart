import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:restaurant_app/data/model/restaurant.dart';

class BodyOfDetailScreenWidget extends StatelessWidget {
  const BodyOfDetailScreenWidget({super.key, required this.restaurant});

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.network(restaurant.picture, fit: BoxFit.cover),
            const SizedBox.square(dimension: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  restaurant.name,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                Text(
                  restaurant.city,
                  style: Theme.of(
                    context,
                  ).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w400),
                ),
              ],
            ),
            Row(
              children: [
                StarRating(
                  rating: restaurant.rating.toDouble(),
                  color: Colors.orange,
                ),
                const SizedBox.square(dimension: 4),
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
          ],
        ),
      ),
    );
  }
}
