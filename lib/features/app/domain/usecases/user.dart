import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:jpt_app/core/error/failures.dart';
import 'package:jpt_app/core/usecase.dart';
import 'package:jpt_app/features/app/domain/repositories/user_respository.dart';

class UserLogIn implements UseCase<bool, UserParams> {
  final UserLogInRepository repository;

  UserLogIn(this.repository);

  Future<Either<Failure, bool>> call(UserParams params) async {
    return await repository.logInWithEmailAndPassword(
        params.email, params.password);
  }
}

class UserParams extends Equatable {
  final String email;
  final String password;

  UserParams({@required this.email, @required this.password});

  @override
  List<Object> get props => [email, password];
}
