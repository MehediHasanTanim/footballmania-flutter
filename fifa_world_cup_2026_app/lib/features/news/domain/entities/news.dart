class News {
  const News({
    required this.id,
    required this.title,
    required this.description,
    required this.content,
    this.imageUrl,
    required this.sourceName,
    this.sourceUrl,
    this.publishedAt,
    this.url,
  });

  final int id;
  final String title;
  final String description;
  final String content;
  final String? imageUrl;
  final String sourceName;
  final String? sourceUrl;
  final DateTime? publishedAt;
  final String? url;

  bool get hasImage => imageUrl != null && imageUrl!.trim().isNotEmpty;
  bool get hasTitle => title.trim().isNotEmpty;
  bool get hasSourceUrl => (sourceUrl ?? url)?.trim().isNotEmpty == true;
}
