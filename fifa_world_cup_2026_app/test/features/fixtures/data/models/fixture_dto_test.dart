import 'package:fifa_world_cup_2026_app/features/fixtures/data/models/fixture_dto.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('parses fixture dto from backend json and maps to entity', () {
    final dto = FixtureDto.fromJson({
      'id': '10',
      'home_team_id': 1,
      'home_team_name': 'USA',
      'awayTeamId': '2',
      'awayTeamName': 'Canada',
      'match_date_utc': '2026-06-11T20:00:00Z',
      'venue': 'MetLife Stadium',
      'stage': 'Group Stage',
      'group': 'A',
      'status': 'scheduled',
    });

    expect(dto.id, 10);
    expect(dto.awayTeamId, 2);
    expect(dto.matchDateUtc, DateTime.utc(2026, 6, 11, 20));
    expect(dto.toEntity().homeTeamName, 'USA');
  });

  test('round-trips fixture through cached model', () {
    final dto = FixtureDto.fromJson({
      'id': 10,
      'home_team_id': 1,
      'home_team_name': 'USA',
      'away_team_id': 2,
      'away_team_name': 'Canada',
      'match_date_utc': '2026-06-11T20:00:00Z',
      'venue': 'MetLife Stadium',
      'stage': 'Group Stage',
      'status': 'scheduled',
    });

    final cached = dto.toCachedModel();
    final restored = FixtureDto.fromCachedModel(cached);

    expect(restored.id, dto.id);
    expect(restored.homeTeamName, dto.homeTeamName);
  });
}
