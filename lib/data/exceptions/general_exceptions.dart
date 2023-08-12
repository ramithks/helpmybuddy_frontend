class GeneralException implements Exception {
  final String message;

  GeneralException(this.message);
}

class DatabaseException implements Exception {
  final String message;

  DatabaseException(this.message);
}

class ValidationException implements Exception {
  final String message;

  ValidationException(this.message);
}

class FileOperationException implements Exception {
  final String message;

  FileOperationException(this.message);
}

class ConfigurationException implements Exception {
  final String message;

  ConfigurationException(this.message);
}

class ServiceUnavailableException implements Exception {
  final String message;

  ServiceUnavailableException(this.message);
}

class PermissionDeniedException implements Exception {
  final String message;

  PermissionDeniedException(this.message);
}
