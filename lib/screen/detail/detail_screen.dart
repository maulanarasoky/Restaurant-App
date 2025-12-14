import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatefulWidget {
  final int restaurantId;

  const DetailScreen({super.key, required this.restaurantId});

  @override
  State<StatefulWidget> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Restaurant Detail"),
        actions: [],
      ),
    );
  }
}
