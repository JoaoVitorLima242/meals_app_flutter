import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/features/categories/widgets/category_grid_item.dart';
import 'package:meals_app/features/meals/meals_screen.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  void _onSelectCategory(
    BuildContext context,
    String category,
  ) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => const MealsScreen(
          meals: [],
          title: 'headline6',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
      ),
      body: GridView(
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
                onSelectCategory: _onSelectCategory,
              ),
            )
            .toList(),
      ),
    );
  }
}
