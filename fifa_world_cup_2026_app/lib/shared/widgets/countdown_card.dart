import 'package:flutter/material.dart';

import '../../features/countdown/domain/entities/countdown.dart';

class CountdownCard extends StatelessWidget {
  const CountdownCard({
    super.key,
    required this.title,
    required this.countdown,
  });

  final String title;
  final Countdown countdown;

  @override
  Widget build(BuildContext context) {
    final values = [
      ('Days', countdown.days),
      ('Hours', countdown.hours),
      ('Mins', countdown.minutes),
      ('Secs', countdown.seconds),
    ];

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: Card(
        key: ValueKey(countdown.seconds),
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 12),
              if (countdown.isExpired)
                Text(
                  'Kickoff reached',
                  style: Theme.of(context).textTheme.headlineSmall,
                )
              else
                Row(
                  children: values
                      .map(
                        (value) => Expanded(
                          child: _CountdownCell(
                            label: value.$1,
                            value: value.$2,
                          ),
                        ),
                      )
                      .toList(growable: false),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CountdownCell extends StatelessWidget {
  const _CountdownCell({required this.label, required this.value});

  final String label;
  final int value;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 3),
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        children: [
          Text(
            value.toString().padLeft(2, '0'),
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w900,
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
          ),
          Text(label, style: Theme.of(context).textTheme.labelMedium),
        ],
      ),
    );
  }
}
