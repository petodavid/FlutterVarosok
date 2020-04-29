import 'package:dartz/dartz.dart';
import 'package:jpt_app/core/error/failures.dart';

abstract class UserLogInRepository {
  Future<Either<Failure, bool>> logInWithEmailAndPassword(
      String email, String password);

  signOut();
}
