import '../../../../shared/widgets/debounced_search_field.dart';

class NewsSearchBar extends DebouncedSearchField {
  const NewsSearchBar({
    super.key,
    required super.onChanged,
    super.initialValue,
    super.onClear,
  }) : super(hintText: 'Search title, source, keyword, or date');
}
