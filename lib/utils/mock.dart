import 'dart:math';

class MockUtils {
  MockUtils._();

  /// Simulates a small fake delay
  /// Useful for testing purposes
  static Future<void> fakeDelay() async {
    await Future.delayed(Duration(milliseconds: 500 + Random().nextInt(1000)));
  }
}