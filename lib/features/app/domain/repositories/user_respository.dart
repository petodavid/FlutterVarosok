import 'package:dartz/dartz.dart';
import 'package:jpt_app/core/error/failures.dart';

abstract class UserRepository {
  Future<Either<Failure, bool>> logInWithEmailAndPassword(
      String email, String password);

  Future<bool> isSignedIn();

  void signOut();
}
