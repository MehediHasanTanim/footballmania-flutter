import '../../data/datasources/filter_local_data_source.dart';

class GetSavedFilter {
  const GetSavedFilter(this._localDataSource);

  final FilterLocalDataSource _localDataSource;

  Map<String, dynamic>? call(String key) =>
      _localDataSource.getSavedFilter(key);
}
