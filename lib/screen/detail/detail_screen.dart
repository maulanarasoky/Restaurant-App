import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/provider/detail/restaurant_detail_provider.dart';
import 'package:restaurant_app/screen/detail/body_of_detail_screen_widget.dart';
import 'package:restaurant_app/static/restaurant_detail_result_state.dart';

class DetailScreen extends StatefulWidget {
  final String restaurantId;
  final String imageUrl;

  const DetailScreen({
    super.key,
    required this.restaurantId,
    required this.imageUrl,
  });

  @override
  State<StatefulWidget> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      context.read<RestaurantDetailProvider>().fetchRestaurantDetails(
        widget.restaurantId,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 280,
            pinned: true,
            backgroundColor: Colors.black,
            leading: BackButton(color: Colors.white),
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag: widget.restaurantId,
                child: Material(
                  type: MaterialType.transparency,
                  child: Image.network(widget.imageUrl, fit: BoxFit.cover),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Consumer<RestaurantDetailProvider>(
              builder: (context, value, child) {
                return switch (value.resultState) {
                  RestaurantDetailLoadingState() => const Padding(
                    padding: EdgeInsets.only(top: 16),
                    child: Center(child: CircularProgressIndicator()),
                  ),
                  RestaurantDetailLoadedState(data: var restaurant) =>
                    BodyOfDetailScreenWidget(restaurant: restaurant),
                  RestaurantDetailErrorState(error: var message) => Center(
                    child: Text(message),
                  ),
                  _ => const SizedBox(),
                };
              },
            ),
          ),
        ],
      ),
    );
  }
}
