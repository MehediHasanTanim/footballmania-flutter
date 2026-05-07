class TeamFilter {
  const TeamFilter({this.searchQuery, this.group, this.favoriteOnly = false});

  final String? searchQuery;
  final String? group;
  final bool favoriteOnly;

  bool get hasSearch => searchQuery?.trim().isNotEmpty == true;

  bool get hasFilters => group?.trim().isNotEmpty == true || favoriteOnly;

  bool get isEmpty => !hasSearch && !hasFilters;

  TeamFilter copyWith({
    String? searchQuery,
    String? group,
    bool? favoriteOnly,
    bool clearSearch = false,
    bool clearGroup = false,
  }) {
    return TeamFilter(
      searchQuery: clearSearch ? null : searchQuery ?? this.searchQuery,
      group: clearGroup ? null : group ?? this.group,
      favoriteOnly: favoriteOnly ?? this.favoriteOnly,
    );
  }
}
