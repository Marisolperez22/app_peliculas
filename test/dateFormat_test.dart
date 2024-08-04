import 'package:app_peliculas/config/helpers/human_formats.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('HumanFormats', () {
    test('number formats correctly with default decimals', () {
      expect(HumanFormats.number(12345), '12K'); // Example value
    });

    test('number formats correctly with specified decimals', () {
      expect(HumanFormats.number(12345.6789, 2), '12.35K'); // Example value
    });

    test('shortDate formats correctly', () {
      final date = DateTime(2023, 8, 3);
      expect(
          HumanFormats.shortDate(date), '3 ago. 2023'); // Assuming 'es' locale
    });
  });
}
