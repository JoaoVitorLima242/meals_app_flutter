import 'package:flutter/material.dart';

class DetailsInformationItem extends StatelessWidget {
  const DetailsInformationItem(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.bodyMedium,
    );
  }
}
