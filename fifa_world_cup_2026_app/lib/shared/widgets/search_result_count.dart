import 'package:flutter/material.dart';

class SearchResultCount extends StatelessWidget {
  const SearchResultCount({
    super.key,
    required this.count,
    required this.label,
  });

  final int count;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        '$count $label',
        style: Theme.of(context).textTheme.bodySmall,
      ),
    );
  }
}
