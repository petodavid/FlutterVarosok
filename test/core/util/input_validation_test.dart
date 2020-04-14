import 'package:flutter_test/flutter_test.dart';
import 'package:jpt_app/core/util/input_validation.dart';
import 'package:matcher/matcher.dart';

void main() {
  InputValidation inputConverter;
  setUp(() {
    inputConverter = InputValidation();
  });

  group('email input validation', () {
    test(
      'should return false in case of a invalid email',
      () {
        final email = 'david.peto123gmail.com';
        expect(() => inputConverter.isValidEmail(email),
            throwsA(TypeMatcher<InvalidEmailException>()));
      },
    );
  });

  group('password input validation', () {
    test(
      'should return false in case of a not strong enought password',
      () {
        final password = 'jelszo';
        expect(() => inputConverter.isValidPassword(password),
            throwsA(TypeMatcher<InvalidPasswordException>()));
      },
    );
  });
}
