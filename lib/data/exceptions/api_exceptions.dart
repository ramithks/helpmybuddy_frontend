class ClientErrorException implements Exception {
  final String message;
  final int statusCode;

  ClientErrorException(this.message, this.statusCode);
}

class AuthenticationException implements Exception {
  final String message;
  final int statusCode;

  AuthenticationException(this.message, this.statusCode);
}

class AuthorizationException implements Exception {
  final String message;
  final int statusCode;

  AuthorizationException(this.message, this.statusCode);
}

class NotFoundException implements Exception {
  final String message;
  final int statusCode;

  NotFoundException(this.message, this.statusCode);
}

class ServerErrorException implements Exception {
  final String message;
  final int statusCode;

  ServerErrorException(this.message, this.statusCode);
}

class NetworkException implements Exception {
  final String message;

  NetworkException(this.message);
}

class UnsupportedMethodException implements Exception {
  final String message;

  UnsupportedMethodException(this.message);
}

class CacheException implements Exception {
  final String message;

  CacheException(this.message);
}
