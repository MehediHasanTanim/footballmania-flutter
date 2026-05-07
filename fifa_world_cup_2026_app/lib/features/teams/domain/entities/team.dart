class Team {
  const Team({
    required this.id,
    required this.name,
    required this.countryCode,
    this.flagUrl,
    this.group,
    this.coach,
    this.fifaRanking,
  });

  final int id;
  final String name;
  final String countryCode;
  final String? flagUrl;
  final String? group;
  final String? coach;
  final int? fifaRanking;

  String get displayName => countryCode.isEmpty ? name : '$name ($countryCode)';
}
