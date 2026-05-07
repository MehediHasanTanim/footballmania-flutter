import '../../../../shared/widgets/debounced_search_field.dart';

class FixtureSearchBar extends DebouncedSearchField {
  const FixtureSearchBar({
    super.key,
    required super.onChanged,
    super.initialValue,
    super.onClear,
  }) : super(hintText: 'Search team, venue, stage, group, status, or date');
}
