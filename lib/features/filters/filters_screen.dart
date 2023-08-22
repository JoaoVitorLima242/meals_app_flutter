import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/features/filters/widgets/filters_check_item.dart';
import 'package:meals_app/features/tab_bar/widgets/main_drawer.dart';
import 'package:meals_app/providers/filter_provider.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});

  void onFilterCheck(WidgetRef ref, Filter filter, bool isChecked) {
    ref.read(filterProvider.notifier).setFilter(filter, isChecked);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filters = ref.watch(filterProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      drawer: const MainDrawer(currentPage: DrawerRoutes.filters),
      body: Column(children: [
        FilterCheckItem(
          title: "Gluten-free",
          subtitle: "Only include gluten-free meals",
          value: filters[Filter.glutenFree]!,
          onChanged: (isChecked) {
            onFilterCheck(ref, Filter.glutenFree, isChecked);
          },
        ),
        FilterCheckItem(
          title: "Lactose-free",
          subtitle: "Only include lactose-free meals",
          value: filters[Filter.lactoseFree]!,
          onChanged: (isChecked) {
            onFilterCheck(ref, Filter.lactoseFree, isChecked);
          },
        ),
        FilterCheckItem(
          title: "Vegetarian",
          subtitle: "Only include vegetarian meals",
          value: filters[Filter.vegetarian]!,
          onChanged: (isChecked) {
            onFilterCheck(ref, Filter.vegetarian, isChecked);
          },
        ),
        FilterCheckItem(
          title: "Vegan",
          subtitle: "Only include vegan meals",
          value: filters[Filter.vegan]!,
          onChanged: (isChecked) {
            onFilterCheck(ref, Filter.vegan, isChecked);
          },
        ),
      ]),
    );
  }
}
