import 'package:fifa_world_cup_2026_app/features/news/domain/entities/news.dart';
import 'package:fifa_world_cup_2026_app/features/news/domain/usecases/sort_news_by_published_date.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('sorts newest first and ignores invalid news', () {
    const useCase = SortNewsByPublishedDate();
    final result = useCase([
      _news(1, DateTime.utc(2026, 6, 10)),
      _news(2, DateTime.utc(2026, 6, 12)),
      _news(3, DateTime.utc(2026, 6, 11), title: ''),
      _news(4, DateTime.utc(2026, 6, 13), sourceUrl: null),
    ]);

    expect(result.map((news) => news.id), [2, 1]);
  });
}

News _news(
  int id,
  DateTime publishedAt, {
  String title = 'Title',
  String? sourceUrl = 'https://source.test',
}) {
  return News(
    id: id,
    title: title,
    description: 'Description',
    content: 'Content',
    sourceName: 'Source',
    sourceUrl: sourceUrl,
    publishedAt: publishedAt,
  );
}
