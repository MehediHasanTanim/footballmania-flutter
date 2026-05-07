class Failure {
  const Failure({required this.message, this.code, this.technicalMessage});

  final String message;
  final String? code;
  final String? technicalMessage;

  @override
  String toString() => 'Failure(code: $code, message: $message)';
}
