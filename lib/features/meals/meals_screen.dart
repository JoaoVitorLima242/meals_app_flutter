import 'package:flutter/material.dart';
import 'package:meals_app/features/meal_details/meal_details_screen.dart';
import 'package:meals_app/features/meals/widgets/meal_item.dart';
import 'package:meals_app/models/meal.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen(
      {super.key,
      required this.meals,
      this.title,
      required this.onToggleFavorite});

  final List<Meal> meals;
  final String? title;
  final void Function(Meal meal) onToggleFavorite;

  void _selectMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealDetailsScreen(
          meal: meal,
          onToggleFavorite: onToggleFavorite,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget screenContent = Center(
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
      screenContent = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (ctx, index) => MealItem(
          meal: meals[index],
          onSelectMeal: (meal) {
            _selectMeal(context, meal);
          },
        ),
      );
    }

    if (title == null) {
      return screenContent;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: screenContent,
    );
  }
}
