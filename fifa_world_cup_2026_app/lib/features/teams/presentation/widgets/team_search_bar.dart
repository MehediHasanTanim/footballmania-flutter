import '../../../../shared/widgets/debounced_search_field.dart';

class TeamSearchBar extends DebouncedSearchField {
  const TeamSearchBar({
    super.key,
    required super.onChanged,
    super.initialValue,
    super.onClear,
  }) : super(hintText: 'Search team, country code, or group');
}
