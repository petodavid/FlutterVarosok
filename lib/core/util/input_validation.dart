import 'package:dartz/dartz.dart';
import 'package:jpt_app/core/error/failures.dart';

class InputValidation {
  Either<Failure, bool> isValidEmail(String email) {
    bool validEmail = RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(email);
    return validEmail ? Right(true) : Left(InvalidInputFailure());
  }

  Either<Failure, bool> isValidPassword(String password) {
    bool validPassword = RegExp(r'^(?=.{8,})').hasMatch(password);
    return validPassword ? Right(true) : Left(InvalidInputFailure());
  }
}

class InvalidInputFailure extends Failure {}
