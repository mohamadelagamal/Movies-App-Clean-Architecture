import 'package:movies_app/core/network/error_message_model.dart';

// The ServerException class is used to represent a server exception.
class ServerException implements Exception {
  // The errorMessageModel property is an ErrorMessageModel object that represents the error message.
  final ErrorMessageModel errorMessageModel;

  // The constructor initializes the errorMessageModel property.
  const ServerException({required this.errorMessageModel});
}

// The LocalDatabaseException class is used to represent a local database exception.
class LocalDatabaseException implements Exception {
  // The message property is a string that represents the error message.
  final String message;
  // The constructor initializes the message property.
  const LocalDatabaseException({required this.message});
}