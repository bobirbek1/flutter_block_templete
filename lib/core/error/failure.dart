import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final List properties;

  const Failure({this.properties = const []});

  @override
  List<Object?> get props => properties;
}

class ServerUnknownFailure extends Failure {
  final String? message;
  ServerUnknownFailure({this.message}) : super(properties: [message]);
}

class ServerTimeOutFailure extends Failure {
  final String? message;

  ServerTimeOutFailure({this.message}) : super(properties: [message]);
}

class ServerUnAuthorizeFailure extends Failure {
  final String? message;

  ServerUnAuthorizeFailure({this.message}) : super(properties: [message]);
}

class ServerNotFoundFailure extends Failure {
  final String? message;

  ServerNotFoundFailure({this.message}) : super(properties: [message]);
}

class ServerCancelFailure extends Failure {
  final String? message;

  ServerCancelFailure({this.message}) : super(properties: [message]);
}

class CacheFailure extends Failure {}
