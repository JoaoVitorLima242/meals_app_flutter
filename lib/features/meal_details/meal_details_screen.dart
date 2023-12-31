import 'package:flutter/material.dart';
import 'package:meals_app/features/meal_details/widgets/details_information_list.dart';
import 'package:meals_app/common_widgets/favorite_button.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/features/meal_details/widgets/details_title.dart';

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen({
    super.key,
    required this.meal,
  });

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          FavoriteButton(meal: meal),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: meal.id,
              child: Image.network(
                meal.imageUrl,
                width: double.infinity,
                height: 300,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 14),
            const DetailsTitle('Ingredients'),
            const SizedBox(height: 14),
            ...meal.ingredients
                .map((ingredient) => DetailsInformationItem(ingredient))
                .toList(),
            const SizedBox(height: 14),
            const DetailsTitle('Steps'),
            const SizedBox(height: 14),
            ...meal.steps
                .map(
                  (step) => Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 16),
                    child: DetailsInformationItem(step),
                  ),
                )
                .toList(),
          ],
        ),
      ),
    );
  }
}
