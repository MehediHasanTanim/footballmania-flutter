import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_scaffold.dart';
import '../providers/settings_provider.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingsProvider);
    final notifier = ref.read(settingsProvider.notifier);

    return AppScaffold(
      title: 'Settings',
      body: ListView(
        children: [
          Text('Theme', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 8),
          SegmentedButton<ThemeMode>(
            segments: const [
              ButtonSegment(
                value: ThemeMode.system,
                label: Text('System'),
                icon: Icon(Icons.phone_iphone),
              ),
              ButtonSegment(
                value: ThemeMode.light,
                label: Text('Light'),
                icon: Icon(Icons.light_mode),
              ),
              ButtonSegment(
                value: ThemeMode.dark,
                label: Text('Dark'),
                icon: Icon(Icons.dark_mode),
              ),
            ],
            selected: {settings.themeMode},
            onSelectionChanged: (value) => notifier.setThemeMode(value.first),
          ),
          const SizedBox(height: 24),
          Text('Notifications', style: Theme.of(context).textTheme.titleLarge),
          SwitchListTile(
            title: const Text('Match reminders'),
            subtitle: const Text('Reminder before saved matches kick off'),
            value: settings.matchReminders,
            onChanged: notifier.setMatchReminders,
          ),
          SwitchListTile(
            title: const Text('Goal alerts'),
            subtitle: const Text('Notify when live favorites score'),
            value: settings.goalAlerts,
            onChanged: notifier.setGoalAlerts,
          ),
          SwitchListTile(
            title: const Text('Live score changes'),
            subtitle: const Text(
              'Scoreline and status updates for live matches',
            ),
            value: settings.liveScoreAlerts,
            onChanged: notifier.setLiveScoreAlerts,
          ),
          SwitchListTile(
            title: const Text('News alerts'),
            subtitle: const Text('Breaking World Cup news updates'),
            value: settings.newsAlerts,
            onChanged: notifier.setNewsAlerts,
          ),
          const SizedBox(height: 24),
          Text('Cache', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 8),
          AppButton(
            label: 'Clear expired cache',
            icon: Icons.cleaning_services,
            isLoading: settings.isClearingCache,
            onPressed: () => notifier.clearExpiredCache(),
          ),
          const SizedBox(height: 12),
          OutlinedButton.icon(
            onPressed: settings.isClearingCache
                ? null
                : () => notifier.clearAllCache(),
            icon: const Icon(Icons.delete_sweep),
            label: const Text('Clear all cache'),
          ),
          const SizedBox(height: 24),
          Text('About', style: Theme.of(context).textTheme.titleLarge),
          const Card(
            child: ListTile(
              leading: Icon(Icons.sports_soccer),
              title: Text('FIFA World Cup 2026'),
              subtitle: Text('Version 1.0.0+1'),
            ),
          ),
        ],
      ),
    );
  }
}
