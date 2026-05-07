import 'package:fifa_world_cup_2026_app/features/search/domain/entities/recent_search.dart';
import 'package:fifa_world_cup_2026_app/features/search/domain/repositories/recent_search_repository.dart';
import 'package:fifa_world_cup_2026_app/features/search/domain/usecases/add_recent_search.dart';
import 'package:fifa_world_cup_2026_app/features/search/domain/usecases/clear_recent_searches.dart';
import 'package:fifa_world_cup_2026_app/features/search/domain/usecases/get_recent_searches.dart';
import 'package:fifa_world_cup_2026_app/features/search/domain/usecases/remove_recent_search.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late _RecentSearchRepository repository;
  late AddRecentSearch add;
  late GetRecentSearches get;
  late RemoveRecentSearch remove;
  late ClearRecentSearches clear;

  setUp(() {
    repository = _RecentSearchRepository();
    add = AddRecentSearch(repository);
    get = GetRecentSearches(repository);
    remove = RemoveRecentSearch(repository);
    clear = ClearRecentSearches(repository);
  });

  test('adds removes and clears recent searches', () async {
    await add(type: SearchType.news, query: 'stadium');
    await add(type: SearchType.news, query: 'tickets');

    expect(get(SearchType.news).map((search) => search.query), [
      'tickets',
      'stadium',
    ]);

    await remove(SearchType.news, 'stadium');
    expect(get(SearchType.news).map((search) => search.query), ['tickets']);

    await clear(SearchType.news);
    expect(get(SearchType.news), isEmpty);
  });

  test('prevents duplicates and keeps latest on top', () async {
    await add(type: SearchType.fixture, query: 'USA');
    await add(type: SearchType.fixture, query: 'usa');

    expect(get(SearchType.fixture), hasLength(1));
    expect(get(SearchType.fixture).single.query, 'usa');
  });

  test('limits recent searches to latest 10 per type', () async {
    for (var i = 0; i < 12; i++) {
      await add(type: SearchType.team, query: 'team-$i');
    }

    final result = get(SearchType.team);
    expect(result, hasLength(10));
    expect(result.first.query, 'team-11');
    expect(result.last.query, 'team-2');
  });
}

class _RecentSearchRepository implements RecentSearchRepository {
  final _items = <RecentSearch>[];

  @override
  Future<void> addRecentSearch(RecentSearch search) async {
    _items.removeWhere((item) => item.key == search.key);
    _items.insert(0, search);
    final typeItems = _items.where((item) => item.type == search.type).toList();
    for (final item in typeItems.skip(10)) {
      _items.removeWhere((candidate) => candidate.key == item.key);
    }
  }

  @override
  Future<void> clearRecentSearches(SearchType type) async {
    _items.removeWhere((item) => item.type == type);
  }

  @override
  List<RecentSearch> getRecentSearches(SearchType type) {
    return _items.where((item) => item.type == type).toList(growable: false);
  }

  @override
  Future<void> removeRecentSearch(SearchType type, String query) async {
    final key = '${type.name}:${query.trim().toLowerCase()}';
    _items.removeWhere((item) => item.key == key);
  }
}
