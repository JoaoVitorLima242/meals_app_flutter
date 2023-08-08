import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
    required this.meals,
    required this.title,
  });

  final List<Meal> meals;
  final String title;

  @override
  Widget build(BuildContext context) {
    Widget scaffoldBody = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Uh oh... nothing here!',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 16),
          const Text('Trying selecting a different category!'),
          const SizedBox(height: 16),
        ],
      ),
    );

    if (meals.isNotEmpty) {
      scaffoldBody = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (ctx, index) => Text(meals[index].title),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: scaffoldBody,
    );
  }
}
