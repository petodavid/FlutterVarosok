import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth auth = FirebaseAuth.instance;

class CurrentUser {
  Future<FirebaseUser> currentUser() async {
    return await FirebaseAuth.instance.currentUser();
  }

  Future<bool> isSignedIn() async {
    return (await currentUser() == null) ? false : true;
  }

  void signOut() async {
    await auth.signOut();
  }
}
