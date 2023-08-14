import 'package:dio/dio.dart';

class GeneralException extends DioException {
  GeneralException(String message)
      : super(requestOptions: RequestOptions(path: ''), error: message);
}

class DatabaseException extends DioException {
  DatabaseException(String message)
      : super(requestOptions: RequestOptions(path: ''), error: message);
}

class ValidationException extends DioException {
  ValidationException(String message)
      : super(requestOptions: RequestOptions(path: ''), error: message);
}

class FileOperationException extends DioException {
  FileOperationException(String message)
      : super(requestOptions: RequestOptions(path: ''), error: message);
}

class ConfigurationException extends DioException {
  ConfigurationException(String message)
      : super(requestOptions: RequestOptions(path: ''), error: message);
}

class ServiceUnavailableException extends DioException {
  ServiceUnavailableException(String message)
      : super(requestOptions: RequestOptions(path: ''), error: message);
}
