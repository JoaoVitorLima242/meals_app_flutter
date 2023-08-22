import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meal.dart';

class FavoritesNotifier extends StateNotifier<List<Meal>> {
  FavoritesNotifier() : super([]);

  void toggleMealFavoritessStatus(Meal meal) {
    final mealIsFavorite = state.contains(meal);

    if (mealIsFavorite) {
      state = state.where((m) => m.id != meal.id).toList();

      return;
    }

    state = [...state, meal];
  }
}

final favoritesMealsProvider =
    StateNotifierProvider<FavoritesNotifier, List<Meal>>(
  (ref) => FavoritesNotifier(),
);
