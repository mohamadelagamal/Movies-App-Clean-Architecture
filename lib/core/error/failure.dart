import 'package:equatable/equatable.dart';

// The Failure class is an abstract class that represents a failure.
abstract class Failure extends Equatable {
  // The message property is a string that represents the error message.
  final String message;
  // The constructor initializes the message property.
  const Failure(this.message);
  // The get props method is used to compare Failure objects.
  @override
  List<Object> get props => [message];
}
// The ServerFailure class is a subclass of Failure that represents a server failure.
class ServerFailure extends Failure {
  // The constructor initializes the message property.
  const ServerFailure(super.message);
}
// The CacheFailure class is a subclass of Failure that represents a cache failure.
class DatabaseFailure extends Failure {
  // The constructor initializes the message property.
  const DatabaseFailure(super.message);
}