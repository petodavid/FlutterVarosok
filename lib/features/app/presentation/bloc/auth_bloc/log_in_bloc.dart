import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:jpt_app/core/error/failures.dart';
import 'package:jpt_app/features/app/domain/usecases/user.dart';
import 'package:jpt_app/features/app/presentation/widgets/flush_bar_for_local_notification.dart';
import 'package:jpt_app/main.dart';

import './bloc.dart';

class LogInBloc extends Bloc<LogInEvent, LogInState> {
  final User user;

  LogInBloc({@required this.user});

  @override
  LogInState get initialState => Empty();

  @override
  Stream<LogInState> mapEventToState(
    LogInEvent event,
  ) async* {
    if (event is UserSignIn) {
      final failureOrUser =
          await user(UserParams(email: event.email, password: event.password));
      yield* _eitherUserOrErrorState(failureOrUser);
    }
    if (event is UserSignOut) {
      user.signOut();
    }
    if (event is CheckForCurrentUser) {
      final isLoggedIn = await user.isSignedIn();
      if (isLoggedIn) {
        yield Authorized();
        return;
      }
      yield Unauthorized();
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
      LocalNotificationFlushBar(context: blocContext).showAuthException();
      return 'AuthPlatformFailure';
    case InvalidEmailFailure:
      LocalNotificationFlushBar(context: blocContext)
          .showInvalidEmailException();
      return 'InvalidEmailFailure';
    case InvalidPasswordFailure:
      LocalNotificationFlushBar(context: blocContext)
          .showInvalidPasswordException();
      return 'InvalidPasswordFailure';
    default:
      return 'Unexpected Error';
  }
}
