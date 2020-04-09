import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:jpt_app/core/auth/currest_user.dart';
import 'package:jpt_app/core/util/input_validation.dart';
import 'package:jpt_app/features/app/presentation/widgets/flush_bar_for_local_notification.dart';

class User {
  Future<bool> logInAccount(
      String email, String password, BuildContext context) async {
    try {
      InputValidation().isValidEmail(email);
      InputValidation().isValidPassword(password);
      final FirebaseUser user = (await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      ))
          .user;
      return (user == null) ? false : true;
    } on PlatformException catch (_) {
      LocalNotificationFlushBar(context: context).showAuthException();
    } on InvalidEmailException catch (_) {
      LocalNotificationFlushBar(context: context).showInvalidEmailException();
    } on InvalidPasswordException catch (_) {
      LocalNotificationFlushBar(context: context)
          .showInvalidPasswordException();
    }
    return false;
  }
}
