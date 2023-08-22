import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/features/categories/widgets/category_grid_item.dart';
import 'package:meals_app/features/meals/meals_screen.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/models/meal.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key, required this.meals});

  final List<Meal> meals;

  void _onSelectCategory(
    BuildContext context,
    Category category,
  ) {
    final filteredMeals = meals
        .where(
          (meal) => meal.categories.contains(category.id),
        )
        .toList();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          meals: filteredMeals,
          title: category.title,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: availableCategories
          .map(
            (e) => CategoryGridItem(
              category: e,
              onSelectCategory: () {
                _onSelectCategory(context, e);
              },
            ),
          )
          .toList(),
    );
  }
}
