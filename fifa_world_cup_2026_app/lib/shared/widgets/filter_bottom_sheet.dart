import 'package:flutter/material.dart';

import '../../core/domain/enums/match_status.dart';
import '../../features/fixtures/domain/entities/fixture_filter.dart';

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({super.key, required this.initialFilter});

  final FixtureFilter initialFilter;

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  late final TextEditingController _teamController;
  late final TextEditingController _groupController;
  late final TextEditingController _stageController;
  MatchStatus? _status;
  DateTime? _date;

  @override
  void initState() {
    super.initState();
    _date = widget.initialFilter.selectedDate;
    _status = widget.initialFilter.selectedStatus;
    _teamController = TextEditingController(
      text: widget.initialFilter.selectedTeamId?.toString() ?? '',
    );
    _groupController = TextEditingController(
      text: widget.initialFilter.selectedGroup,
    );
    _stageController = TextEditingController(
      text: widget.initialFilter.selectedStage,
    );
  }

  @override
  void dispose() {
    _teamController.dispose();
    _groupController.dispose();
    _stageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          20,
          20,
          20,
          MediaQuery.viewInsetsOf(context).bottom + 20,
        ),
        child: ListView(
          shrinkWrap: true,
          children: [
            Text(
              'Filter fixtures',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            OutlinedButton.icon(
              onPressed: () async {
                final picked = await showDatePicker(
                  context: context,
                  firstDate: DateTime(2026, 1),
                  lastDate: DateTime(2026, 12, 31),
                  initialDate: _date ?? DateTime(2026, 6, 11),
                );
                if (picked != null) setState(() => _date = picked);
              },
              icon: const Icon(Icons.calendar_month),
              label: Text(
                _date == null
                    ? 'Any date'
                    : _date!.toLocal().toString().split(' ').first,
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _teamController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Team ID'),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _groupController,
              decoration: const InputDecoration(labelText: 'Group'),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _stageController,
              decoration: const InputDecoration(labelText: 'Stage'),
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<MatchStatus?>(
              initialValue: _status,
              decoration: const InputDecoration(labelText: 'Status'),
              items: [
                const DropdownMenuItem(value: null, child: Text('Any status')),
                ...MatchStatus.values.map(
                  (status) =>
                      DropdownMenuItem(value: status, child: Text(status.name)),
                ),
              ],
              onChanged: (value) => setState(() => _status = value),
            ),
            const SizedBox(height: 20),
            FilledButton(
              onPressed: () {
                Navigator.of(context).pop(
                  FixtureFilter(
                    selectedDate: _date,
                    selectedTeamId: int.tryParse(_teamController.text.trim()),
                    selectedGroup: _emptyToNull(_groupController.text),
                    selectedStage: _emptyToNull(_stageController.text),
                    selectedStatus: _status,
                  ),
                );
              },
              child: const Text('Apply filters'),
            ),
          ],
        ),
      ),
    );
  }

  String? _emptyToNull(String value) {
    final trimmed = value.trim();
    return trimmed.isEmpty ? null : trimmed;
  }
}
