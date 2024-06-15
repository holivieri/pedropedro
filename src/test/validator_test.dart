import 'package:flutter_test/flutter_test.dart';
import 'package:template_app/src/utils/validator.dart';

void main() {
  test(
    'isValidEmail',
    () {
      expect(
        isValidEmail('text'),
        false,
      );

      expect(
        isValidEmail('test@test.com'),
        true,
      );

      expect(
        isValidEmail('hernan.olivieri@test.com'),
        true,
      );

      expect(
        isValidEmail('123hernan@test.com'),
        false,
      );

      expect(
        isValidEmail('hernan olivieri@test.com'),
        false,
      );

      expect(
        isValidEmail('hern#an@test.com'),
        false,
      );

      expect(
        isValidEmail('hernán@test.com'),
        false,
      );

      expect(
        isValidEmail('hernan@test'),
        false,
      );
    },
  );
}
