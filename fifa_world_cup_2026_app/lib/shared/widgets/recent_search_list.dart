import 'package:flutter/material.dart';

import '../../features/search/domain/entities/recent_search.dart';

class RecentSearchList extends StatelessWidget {
  const RecentSearchList({
    super.key,
    required this.searches,
    required this.onSelected,
    required this.onRemove,
    this.onClear,
  });

  final List<RecentSearch> searches;
  final ValueChanged<String> onSelected;
  final ValueChanged<String> onRemove;
  final VoidCallback? onClear;

  @override
  Widget build(BuildContext context) {
    if (searches.isEmpty) return const SizedBox.shrink();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'Recent searches',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const Spacer(),
            if (onClear != null)
              TextButton(onPressed: onClear, child: const Text('Clear')),
          ],
        ),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: searches
              .map((search) {
                return InputChip(
                  label: Text(search.query),
                  onPressed: () => onSelected(search.query),
                  onDeleted: () => onRemove(search.query),
                );
              })
              .toList(growable: false),
        ),
      ],
    );
  }
}
