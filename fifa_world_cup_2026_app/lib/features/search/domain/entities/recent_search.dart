enum SearchType {
  fixture,
  news,
  team;

  static SearchType fromName(String value) {
    return SearchType.values.firstWhere(
      (type) => type.name == value,
      orElse: () => SearchType.news,
    );
  }
}

class RecentSearch {
  const RecentSearch({
    required this.query,
    required this.type,
    required this.timestamp,
  });

  final String query;
  final SearchType type;
  final DateTime timestamp;

  String get key => '${type.name}:${query.trim().toLowerCase()}';
}
