import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class LogInState {}

class InitialLogInState extends Equatable {
  @override
  List<Object> get props => [];
}

class Empty extends LogInState {}

class Unauthorized extends LogInState {}

class Authorized extends LogInState {}

class LogInError extends LogInState {
  final String message;

  LogInError({@required this.message});

  @override
  List<Object> get props => [message];
}
