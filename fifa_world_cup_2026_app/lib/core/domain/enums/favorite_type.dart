enum FavoriteType {
  team,
  match,
  news;

  static FavoriteType fromString(String value) {
    return switch (value.trim().toLowerCase()) {
      'team' => FavoriteType.team,
      'match' || 'fixture' => FavoriteType.match,
      'news' => FavoriteType.news,
      _ => throw ArgumentError.value(
        value,
        'value',
        'Unsupported favorite type',
      ),
    };
  }
}
