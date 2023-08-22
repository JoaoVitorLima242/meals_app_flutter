import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/features/meal_details/widgets/details_information_list.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/features/meal_details/widgets/details_title.dart';
import 'package:meals_app/providers/favorites_provider.dart';

class MealDetailsScreen extends ConsumerWidget {
  const MealDetailsScreen({
    super.key,
    required this.meal,
  });

  final Meal meal;

  void onToggleFavorite(
    BuildContext context,
    WidgetRef ref,
  ) {
    final toggleType = ref
        .read(favoritesMealsProvider.notifier)
        .toggleMealFavoritessStatus(meal);
    final scaffoldMessage = returnMessageByToggleType(toggleType);

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(scaffoldMessage),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            onPressed: () => onToggleFavorite(context, ref),
            icon: const Icon(Icons.star),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              meal.imageUrl,
              width: double.infinity,
              height: 300,
              fit: BoxFit.cover,
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
