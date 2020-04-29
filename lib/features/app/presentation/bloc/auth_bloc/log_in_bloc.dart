import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:jpt_app/core/error/failures.dart';
import 'package:jpt_app/features/app/domain/usecases/user.dart';

import './bloc.dart';

class LogInBloc extends Bloc<LogInEvent, LogInState> {
  final UserLogIn user;

  LogInBloc({@required this.user});

  @override
  LogInState get initialState => Unauthorized();

  @override
  Stream<LogInState> mapEventToState(
    LogInEvent event,
  ) async* {
    if (event is UserLogin) {
      final failureOrUser =
          await user(UserParams(email: event.email, password: event.password));
      yield* _eitherUserOrErrorState(failureOrUser);
    }
  }
}

Stream<LogInState> _eitherUserOrErrorState(
  Either<Failure, bool> either,
) async* {
  yield either.fold(
    (failure) => LogInError(message: _mapLogInFailureToMessage(failure)),
    (bool) => Authorized(),
  );
}

String _mapLogInFailureToMessage(Failure failure) {
  switch (failure.runtimeType) {
    case AuthPlatformFailure:
      return 'AuthPlatformFailure';
    case InvalidEmailFailure:
      return 'InvalidEmailFailure';
    case InvalidPasswordFailure:
      return 'InvalidPasswordFailure';
    default:
      return 'Unexpected Error';
  }
}
