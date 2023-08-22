import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/features/filters/widgets/filters_check_item.dart';
import 'package:meals_app/features/tab_bar/widgets/main_drawer.dart';
import 'package:meals_app/providers/filter_provider.dart';

class FiltersScreen extends ConsumerStatefulWidget {
  const FiltersScreen({super.key});

  @override
  ConsumerState<FiltersScreen> createState() {
    return _FiltersScreen();
  }
}

class _FiltersScreen extends ConsumerState<FiltersScreen> {
  Map<Filter, bool> _filters = {
    Filter.glutenFree: false,
    Filter.lactoseFree: false,
    Filter.vegetarian: false,
    Filter.vegan: false,
  };

  @override
  void initState() {
    super.initState();

    _filters = ref.read(filterProvider);
  }

  void onFilterCheck(Filter filter, bool isChecked) {
    setState(() {
      _filters[filter] = isChecked;
    });

    ref.read(filterProvider.notifier).setFilter(filter, isChecked);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      drawer: const MainDrawer(currentPage: DrawerRoutes.filters),
      body: Column(children: [
        FilterCheckItem(
          title: "Gluten-free",
          subtitle: "Only include gluten-free meals",
          value: _filters[Filter.glutenFree]!,
          onChanged: (isChecked) {
            onFilterCheck(Filter.glutenFree, isChecked);
          },
        ),
        FilterCheckItem(
          title: "Lactose-free",
          subtitle: "Only include lactose-free meals",
          value: _filters[Filter.lactoseFree]!,
          onChanged: (isChecked) {
            setState(() {
              onFilterCheck(Filter.lactoseFree, isChecked);
            });
          },
        ),
        FilterCheckItem(
          title: "Vegetarian",
          subtitle: "Only include vegetarian meals",
          value: _filters[Filter.vegetarian]!,
          onChanged: (isChecked) {
            setState(() {
              onFilterCheck(Filter.vegetarian, isChecked);
            });
          },
        ),
        FilterCheckItem(
          title: "Vegan",
          subtitle: "Only include vegan meals",
          value: _filters[Filter.vegan]!,
          onChanged: (isChecked) {
            setState(() {
              onFilterCheck(Filter.vegan, isChecked);
            });
          },
        ),
      ]),
    );
  }
}
