import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jpt_app/core/util/input_validation.dart';

void main() {
  InputValidation inputConverter;
  setUp(() {
    inputConverter = InputValidation();
  });

  group('email input validation', () {
    test(
      'should return true in case of a valid email',
      () {
        final email = 'david.peto@gmail.com';
        final result = inputConverter.isValidEmail(email);
        expect(result, Right(true));
      },
    );
    test(
      'should return InvalidInputFailure in case of a valid email',
      () {
        final email = 'david.peto123gmail.com';
        final result = inputConverter.isValidEmail(email);
        expect(result, Left(InvalidInputFailure()));
      },
    );
  });

  group('password input validation', () {
    test(
      'should return true in case of a 8 char long string',
      () {
        final email = 'jelszo123';
        final result = inputConverter.isValidPassword(email);
        expect(result, Right(true));
      },
    );
    test(
      'should return InvalidInputFailure in case of a not strong enought password',
      () {
        final password = 'jelszo';
        final result = inputConverter.isValidPassword(password);
        expect(result, Left(InvalidInputFailure()));
      },
    );
  });
}
