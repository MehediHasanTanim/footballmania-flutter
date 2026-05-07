import '../../../../core/domain/value_objects/date_range.dart';

class NewsFilter {
  const NewsFilter({this.searchQuery, this.source, this.dateRange});

  final String? searchQuery;
  final String? source;
  final DateRange? dateRange;

  bool get hasSearch => searchQuery?.trim().isNotEmpty == true;

  bool get hasFilters => source?.trim().isNotEmpty == true || dateRange != null;

  bool get isEmpty => !hasSearch && !hasFilters;

  NewsFilter copyWith({
    String? searchQuery,
    String? source,
    DateRange? dateRange,
    bool clearSearch = false,
    bool clearSource = false,
    bool clearDateRange = false,
  }) {
    return NewsFilter(
      searchQuery: clearSearch ? null : searchQuery ?? this.searchQuery,
      source: clearSource ? null : source ?? this.source,
      dateRange: clearDateRange ? null : dateRange ?? this.dateRange,
    );
  }
}
