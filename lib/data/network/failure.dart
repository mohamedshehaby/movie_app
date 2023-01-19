import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  final FailureType failureType;
  final int code;
  final String message;

  const Failure({
    required this.code,
    required this.message,
    this.failureType = FailureType.api,
  });

  @override
  List<Object> get props => [code, message, failureType];
}

enum FailureType { api, network, database, unAuthorized, sessionDenied }
