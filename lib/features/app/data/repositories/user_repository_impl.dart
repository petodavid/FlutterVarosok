import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:jpt_app/core/error/failures.dart';
import 'package:jpt_app/core/util/input_validation.dart';
import 'package:jpt_app/features/app/domain/repositories/user_respository.dart';

final FirebaseAuth auth = FirebaseAuth.instance;

class UserLogInRepositoryImpl implements UserLogInRepository {
  Future<FirebaseUser> _currentUser() async {
    return await auth.currentUser();
  }

  Future<bool> isSignedIn() async {
    return (await _currentUser() == null) ? false : true;
  }

  @override
  Future<Either<Failure, bool>> logInWithEmailAndPassword(
      String email, String password) async {
    try {
      InputValidation().isValidEmail(email);
      InputValidation().isValidPassword(password);
      final FirebaseUser user = (await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      ))
          .user;
      return (user == null) ? Right(false) : Right(true);
    } on PlatformException catch (_) {
      return (Left(AuthPlatformFailure()));
    } on InvalidEmailException catch (_) {
      return (Left(InvalidEmailFailure()));
    } on InvalidPasswordException catch (_) {
      return (Left(InvalidEmailFailure()));
    }
  }

  @override
  void signOut() async {
    await auth.signOut();
  }
}
