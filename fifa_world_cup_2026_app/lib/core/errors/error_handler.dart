import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

import 'app_exception.dart';
import 'error_message_mapper.dart';
import 'failure.dart';

class ErrorHandler {
  const ErrorHandler({Logger? logger}) : _logger = logger;

  final Logger? _logger;

  AppException exceptionFromDio(DioException error) {
    final statusCode = error.response?.statusCode;
    final responseMessage = _extractMessage(error.response?.data);

    return switch (error.type) {
      DioExceptionType.connectionTimeout ||
      DioExceptionType.sendTimeout ||
      DioExceptionType.receiveTimeout => TimeoutException(details: error),
      DioExceptionType.connectionError => NetworkException(details: error),
      DioExceptionType.badResponse => switch (statusCode) {
        400 || 422 => ValidationException(
          message: responseMessage ?? 'Invalid request',
          code: '$statusCode',
          details: error,
        ),
        401 => UnauthorizedException(code: '$statusCode', details: error),
        403 => ForbiddenException(code: '$statusCode', details: error),
        404 => NotFoundException(code: '$statusCode', details: error),
        _ => ServerException(
          message: responseMessage ?? 'Server error',
          code: statusCode?.toString(),
          details: error,
        ),
      },
      DioExceptionType.cancel => UnknownException(
        message: 'Request was cancelled',
        details: error,
      ),
      DioExceptionType.badCertificate ||
      DioExceptionType.unknown => UnknownException(details: error),
    };
  }

  Failure failureFromException(Object error, [StackTrace? stackTrace]) {
    final exception = error is DioException
        ? exceptionFromDio(error)
        : error is AppException
        ? error
        : UnknownException(details: error);

    _logger?.e(
      exception.message,
      error: exception.details ?? error,
      stackTrace: stackTrace,
    );

    return Failure(
      message: ErrorMessageMapper.fromException(exception),
      code: exception.code,
      technicalMessage: exception.toString(),
    );
  }

  static String? _extractMessage(Object? data) {
    if (data is Map<String, dynamic>) {
      final message = data['message'] ?? data['error'] ?? data['detail'];
      return message?.toString();
    }
    return null;
  }
}
