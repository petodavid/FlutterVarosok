import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class LogInEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class CheckForCurrentUser extends LogInEvent {}

class UserSignOut extends LogInEvent {}

class UserSignIn extends LogInEvent {
  final String email;
  final String password;

  UserSignIn(this.email, this.password);

  @override
  List<Object> get props => [email, password];
}
