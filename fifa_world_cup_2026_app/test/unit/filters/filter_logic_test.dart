import 'package:fifa_world_cup_2026_app/features/fixtures/domain/entities/fixture_filter.dart';
import 'package:fifa_world_cup_2026_app/features/fixtures/domain/usecases/filter_fixtures.dart';
import 'package:fifa_world_cup_2026_app/features/fixtures/domain/usecases/search_fixtures.dart';
import 'package:fifa_world_cup_2026_app/features/news/domain/entities/news_filter.dart';
import 'package:fifa_world_cup_2026_app/features/news/domain/usecases/search_news.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/test_data.dart';
import '../../helpers/test_providers.dart';

void main() {
  const filterFixtures = FilterFixtures();
  const searchFixtures = SearchFixtures();

  test('test_filter_fixtures_by_team', () {
    final result = filterFixtures(fakeFixtures, const FixtureFilter(selectedTeamId: 10));

    expect(result.map((fixture) => fixture.id), [1]);
  });

  test('test_filter_fixtures_by_venue', () {
    final result = searchFixtures(fakeFixtures, 'azteca');

    expect(result.map((fixture) => fixture.id), [2]);
  });

  test('test_filter_fixtures_by_stage', () {
    final result = filterFixtures(fakeFixtures, const FixtureFilter(selectedStage: 'Final'));

    expect(result.map((fixture) => fixture.id), [3]);
  });

  test('test_search_news_by_keyword', () {
    final searchNews = SearchNews(FakeNewsRepository());
    final result = searchNews.filterLocal(
      fakeNewsList,
      const NewsFilter(searchQuery: 'squad'),
    );

    expect(result.map((news) => news.id), [2]);
  });

  test('test_combined_filters_return_expected_results', () {
    final result = filterFixtures(
      fakeFixtures,
      const FixtureFilter(selectedTeamId: 50, selectedStage: 'Final'),
    );

    expect(result.map((fixture) => fixture.id), [3]);
  });

  test('test_reset_filters_returns_all_items', () {
    final result = filterFixtures(fakeFixtures, const FixtureFilter());

    expect(result, hasLength(fakeFixtures.length));
  });
}
