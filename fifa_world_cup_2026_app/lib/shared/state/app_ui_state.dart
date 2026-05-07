sealed class AppUiState<T> {
  const AppUiState();
}

class UiInitial<T> extends AppUiState<T> {
  const UiInitial();
}

class UiLoading<T> extends AppUiState<T> {
  const UiLoading();
}

class UiData<T> extends AppUiState<T> {
  const UiData(this.data);

  final T data;
}

class UiEmpty<T> extends AppUiState<T> {
  const UiEmpty({this.message = 'No data available.'});

  final String message;
}

class UiError<T> extends AppUiState<T> {
  const UiError({required this.message, this.canRetry = true});

  final String message;
  final bool canRetry;
}
