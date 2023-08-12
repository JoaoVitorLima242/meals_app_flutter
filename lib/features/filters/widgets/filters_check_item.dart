import 'package:flutter/material.dart';

class FilterCheckItem extends StatelessWidget {
  const FilterCheckItem({
    super.key,
    required this.value,
    required this.onChanged,
    required this.title,
    required this.subtitle,
  });

  final bool value;
  final void Function(bool isChecked) onChanged;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
        value: value,
        onChanged: onChanged,
        contentPadding: const EdgeInsets.only(left: 34, right: 22),
        title: Text(
          title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
        subtitle: Text(
          subtitle,
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
        activeColor: Theme.of(context).colorScheme.tertiary);
  }
}
