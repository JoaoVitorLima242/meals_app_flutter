import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/meal.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}

List<Meal> formatAvailableMeals(Map<Filter, bool> filters) {
  final availableMeals = dummyMeals.where((meal) {
    if (filters[Filter.glutenFree]! && !meal.isGlutenFree) {
      return false;
    }
    if (filters[Filter.lactoseFree]! && !meal.isLactoseFree) {
      return false;
    }
    if (filters[Filter.vegetarian]! && !meal.isVegetarian) {
      return false;
    }
    if (filters[Filter.vegan]! && !meal.isVegan) {
      return false;
    }
    return true;
  }).toList();

  return availableMeals;
}

class FiltersNotifier extends StateNotifier<Map<Filter, bool>> {
  FiltersNotifier()
      : super(
          {
            Filter.glutenFree: false,
            Filter.lactoseFree: false,
            Filter.vegetarian: false,
            Filter.vegan: false,
          },
        );

  void setFilters(Map<Filter, bool> filters) {
    state = filters;
  }

  void setFilter(Filter filter, bool isActive) {
    state = {...state, filter: isActive};
  }
}

final filterProvider =
    StateNotifierProvider<FiltersNotifier, Map<Filter, bool>>(
        (ref) => FiltersNotifier());
