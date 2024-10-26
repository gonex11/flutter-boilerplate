import 'package:flutter_boilerplate/modules/connectivity/presentation/controllers/connectivity_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/mockito.dart';

import '../../../../helpers/test_helper.mocks.dart';

void main() {
  late ConnectivityController controller;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    Get.testMode = true;

    mockNetworkInfo = MockNetworkInfo();
    controller = ConnectivityController(mockNetworkInfo);
  });

  group('checkConnectivity', () {
    test(
        'isConnected value should return true if device is connected to internet',
        () async {
      // Arrange
      when(mockNetworkInfo.onConnectivityChanged)
          .thenAnswer((_) => Stream.value(true));
      // Act
      await controller.onInit();
      // Assert
      final result = controller.isConnected.value;
      expect(result, true);
    });

    test(
        'isConnected value should return false if device is not connected to internet',
        () async {
      // Arrange
      when(mockNetworkInfo.onConnectivityChanged)
          .thenAnswer((_) => Stream.value(false));
      // Act
      await controller.onInit();
      // Assert
      final result = controller.isConnected.value;
      expect(result, false);
    });
  });
}
