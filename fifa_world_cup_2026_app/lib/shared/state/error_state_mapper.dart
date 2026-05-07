import '../../core/errors/failure.dart';
import 'app_ui_state.dart';

class ErrorStateMapper {
  const ErrorStateMapper._();

  static UiError<T> fromFailure<T>(Failure failure) {
    return UiError<T>(
      message: messageFromFailure(failure),
      canRetry: canRetry(failure),
    );
  }

  static UiError<T> fromObject<T>(Object error) {
    if (error is Failure) return fromFailure<T>(error);
    return UiError<T>(message: 'Something went wrong. Please try again.');
  }

  static String messageFromFailure(Failure failure) {
    final code = failure.code?.toLowerCase() ?? '';
    final message = failure.message.toLowerCase();

    if (_containsAny(code, message, const [
      'network',
      'offline',
      'connection',
      'socket',
    ])) {
      return 'You are offline. Check your connection and try again.';
    }
    if (_containsAny(code, message, const ['timeout'])) {
      return 'The request took too long. Please try again.';
    }
    if (_containsAny(code, message, const [
      'api',
      'server',
      'http',
      '500',
      '502',
      '503',
    ])) {
      return 'The server is unavailable. Please try again later.';
    }
    if (_containsAny(code, message, const ['cache', 'cached', 'saved data'])) {
      return 'Saved data is unavailable right now.';
    }
    if (_containsAny(code, message, const ['empty', 'no data', 'not found'])) {
      return 'No data available.';
    }

    return failure.message.trim().isEmpty
        ? 'Something went wrong. Please try again.'
        : failure.message;
  }

  static bool canRetry(Failure failure) {
    final code = failure.code?.toLowerCase() ?? '';
    final message = failure.message.toLowerCase();
    return !_containsAny(code, message, const [
      'empty',
      'no data',
      'not found',
    ]);
  }

  static bool _containsAny(String code, String message, List<String> tokens) {
    return tokens.any(
      (token) => code.contains(token) || message.contains(token),
    );
  }
}
