import 'package:flutter_boilerplate/presentation/controllers/connectivity_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late ConnectivityController controller;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockNetworkInfo = MockNetworkInfo();
    controller = ConnectivityController(mockNetworkInfo);
  });

  group('checkConnectivity', () {
    test('should return true if device is connected to internet', () async {
      // Arrange
      when(mockNetworkInfo.onConnectivityChanged)
          .thenAnswer((_) => Stream.value(true));
      // Act
      await controller.checkConnectivity();
      final result = await controller.isConnected.value;
      // Assert
      expect(result, true);
    });

    test('should return false if device is not connected to internet',
        () async {
      // Arrange
      when(mockNetworkInfo.onConnectivityChanged)
          .thenAnswer((_) => Stream.value(false));
      // Act
      await controller.checkConnectivity();
      final result = await controller.isConnected.value;
      // Assert
      expect(result, false);
    });
  });
}
