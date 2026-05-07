import 'app_exception.dart';

class ErrorMessageMapper {
  const ErrorMessageMapper._();

  static String fromException(AppException exception) {
    return switch (exception) {
      NetworkException() =>
        'You are offline. Check your connection and try again.',
      TimeoutException() => 'The request took too long. Please try again.',
      UnauthorizedException() =>
        'Your session has expired. Please sign in again.',
      ForbiddenException() =>
        'You do not have permission to access this content.',
      NotFoundException() => 'We could not find what you were looking for.',
      CacheException() => 'Saved data is unavailable right now.',
      ValidationException() => exception.message,
      ServerException() => 'The server is unavailable. Please try again later.',
      UnknownException() => 'Something went wrong. Please try again.',
    };
  }
}
