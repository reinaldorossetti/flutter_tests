import 'package:first_test/maths_util.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Maths utils - ', () {
    test('check for two number addition', () {
      // Arrange
      var a = 10;
      var b = 10;

      // Act
      var sum = add(a, b);

      // Assert
      expect(sum, 20);
    });

    test('check for two numbers substraction', () {
      // Arrange
      var a = 10;
      var b = 10;

      // Act
      var subs = substract(a, b);

      // Assert
      expect(subs, 0);
    });

    test('check for two numbers multiply', () {
      // Arrange
      var a = 10;
      var b = 10;

      // Act
      var m = multipy(a, b);

      // Assert
      expect(m, 100);
    });
  });
}
