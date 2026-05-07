sealed class AppException implements Exception {
  const AppException({required this.message, this.code, this.details});

  final String message;
  final String? code;
  final Object? details;

  @override
  String toString() =>
      'AppException(code: $code, message: $message, details: $details)';
}

class ServerException extends AppException {
  const ServerException({required super.message, super.code, super.details});
}

class NetworkException extends AppException {
  const NetworkException({
    super.message = 'No internet connection',
    super.code,
    super.details,
  });
}

class TimeoutException extends AppException {
  const TimeoutException({
    super.message = 'The request timed out',
    super.code,
    super.details,
  });
}

class UnauthorizedException extends AppException {
  const UnauthorizedException({
    super.message = 'Unauthorized request',
    super.code,
    super.details,
  });
}

class ForbiddenException extends AppException {
  const ForbiddenException({
    super.message = 'Access forbidden',
    super.code,
    super.details,
  });
}

class NotFoundException extends AppException {
  const NotFoundException({
    super.message = 'Resource not found',
    super.code,
    super.details,
  });
}

class CacheException extends AppException {
  const CacheException({required super.message, super.code, super.details});
}

class ValidationException extends AppException {
  const ValidationException({
    required super.message,
    super.code,
    super.details,
  });
}

class UnknownException extends AppException {
  const UnknownException({
    super.message = 'Something went wrong',
    super.code,
    super.details,
  });
}
