import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meal.dart';

enum ToggleFavotitesType { added, removed }

String returnMessageByToggleType(ToggleFavotitesType type) {
  switch (type) {
    case ToggleFavotitesType.added:
      return 'Meal added as a favorite!';
    case ToggleFavotitesType.removed:
      return 'Meal removed!';
  }
}

class FavoritesNotifier extends StateNotifier<List<Meal>> {
  FavoritesNotifier() : super([]);

  ToggleFavotitesType toggleMealFavoritessStatus(Meal meal) {
    final mealIsFavorite = state.contains(meal);

    if (mealIsFavorite) {
      state = state.where((m) => m.id != meal.id).toList();

      return ToggleFavotitesType.removed;
    }

    state = [...state, meal];
    return ToggleFavotitesType.added;
  }
}

final favoritesMealsProvider =
    StateNotifierProvider<FavoritesNotifier, List<Meal>>(
  (ref) => FavoritesNotifier(),
);
