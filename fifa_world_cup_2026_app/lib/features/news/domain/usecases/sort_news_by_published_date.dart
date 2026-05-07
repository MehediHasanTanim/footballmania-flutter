import '../entities/news.dart';

class SortNewsByPublishedDate {
  const SortNewsByPublishedDate();

  List<News> call(List<News> news) {
    final sorted = news.where((item) => item.hasTitle && item.hasSourceUrl).toList(growable: true);
    sorted.sort((a, b) => _publishedAt(b).compareTo(_publishedAt(a)));
    return List.unmodifiable(sorted);
  }

  DateTime _publishedAt(News news) => news.publishedAt ?? DateTime.fromMillisecondsSinceEpoch(0, isUtc: true);
}
