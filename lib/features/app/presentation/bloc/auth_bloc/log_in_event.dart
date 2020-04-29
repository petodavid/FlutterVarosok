import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class LogInEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class UserLogin extends LogInEvent {
  final String email;
  final String password;

  UserLogin(this.email, this.password);

  @override
  List<Object> get props => [email, password];
}
