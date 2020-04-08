class InputValidation {
  isValidEmail(String email) {
    bool validEmail = RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(email);
    if (!validEmail) {
      throw InvalidEmailException();
    }
  }

  isValidPassword(String password) {
    bool validPassword = RegExp(r'^(?=.{8,})').hasMatch(password);
    if (!validPassword) {
      throw InvalidPasswordException();
    }
  }
}

class InvalidEmailException implements Exception {}

class InvalidPasswordException implements Exception {}
