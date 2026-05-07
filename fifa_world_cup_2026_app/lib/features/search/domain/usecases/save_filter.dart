import '../../data/datasources/filter_local_data_source.dart';

class SaveFilter {
  const SaveFilter(this._localDataSource);

  final FilterLocalDataSource _localDataSource;

  Future<void> call(String key, Map<String, dynamic> values) {
    return _localDataSource.saveFilter(key, values);
  }
}
