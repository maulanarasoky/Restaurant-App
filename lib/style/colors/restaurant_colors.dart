import 'package:flutter/material.dart';

enum RestaurantColors {
  blue("Blue", Color(0xFF1976D2)),
  pastelBlue("PastelBlue", Color(0xFFE3F2FD));

  const RestaurantColors(this.name, this.color);

  final String name;
  final Color color;
}