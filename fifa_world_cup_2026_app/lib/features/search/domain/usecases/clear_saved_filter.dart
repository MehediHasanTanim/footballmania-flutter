import '../../data/datasources/filter_local_data_source.dart';

class ClearSavedFilter {
  const ClearSavedFilter(this._localDataSource);

  final FilterLocalDataSource _localDataSource;

  Future<void> call(String key) => _localDataSource.clearSavedFilter(key);
}
