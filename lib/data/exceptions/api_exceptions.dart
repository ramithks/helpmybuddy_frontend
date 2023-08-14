class CustomHttpException implements Exception {
  final String message;
  final int statusCode;

  CustomHttpException(this.message, this.statusCode);
}

class UnsupportedMethodException implements Exception {
  final String message;

  UnsupportedMethodException(this.message);
}

class NetworkException implements Exception {
  final String message;

  NetworkException(this.message);
}

class TimeoutException implements Exception {
  final String message;

  TimeoutException(this.message);
}

class CancellationException implements Exception {
  final String message;

  CancellationException(this.message);
}

class ServerException implements Exception {
  final String message;
  final int statusCode;

  ServerException(this.message, this.statusCode);
}

class ClientException implements Exception {
  final String message;

  ClientException(this.message);
}

class ParsingException implements Exception {
  final String message;

  ParsingException(this.message);
}

class AuthenticationException implements Exception {
  final String message;

  AuthenticationException(this.message);
}

class ConnectionException implements Exception {
  final String message;

  ConnectionException(this.message);
}

class DataNotFoundException implements Exception {
  final String message;

  DataNotFoundException(this.message);
}

class PermissionDeniedException implements Exception {
  final String message;

  PermissionDeniedException(this.message);
}
