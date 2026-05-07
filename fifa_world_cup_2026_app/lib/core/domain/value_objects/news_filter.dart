class NewsFilter {
  const NewsFilter({this.keyword, this.requireSourceUrl = true, this.requireTitle = true});

  final String? keyword;
  final bool requireSourceUrl;
  final bool requireTitle;
}
