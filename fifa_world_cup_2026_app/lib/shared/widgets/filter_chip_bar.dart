import 'package:flutter/material.dart';

class FilterChipData {
  const FilterChipData({required this.label, this.onDeleted});

  final String label;
  final VoidCallback? onDeleted;
}

class FilterChipBar extends StatelessWidget {
  const FilterChipBar({super.key, required this.chips, this.onReset});

  final List<FilterChipData> chips;
  final VoidCallback? onReset;

  @override
  Widget build(BuildContext context) {
    if (chips.isEmpty) return const SizedBox.shrink();
    return Align(
      alignment: Alignment.centerLeft,
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        children: [
          ...chips.map(
            (chip) => Chip(label: Text(chip.label), onDeleted: chip.onDeleted),
          ),
          if (onReset != null)
            ActionChip(label: const Text('Reset'), onPressed: onReset),
        ],
      ),
    );
  }
}
