import 'package:flutter_test/flutter_test.dart';
import 'package:github_contact/extensions/string_extensions.dart';

void main() {
  group('Compare Strings diacritics with nonDiacritics', () {
    test('Is Equal', () {
      const diacriticString = 'Caminhão';

      final nonDiacriticString = diacriticString.withoutDiacriticalMarks;
      expect(nonDiacriticString, 'Caminhao');
    });
    test('Is Equal 2', () {
      const diacriticString = 'canção';

      final nonDiacriticString = diacriticString.withoutDiacriticalMarks;
      expect(nonDiacriticString, 'cancao');
    });
  });
}
