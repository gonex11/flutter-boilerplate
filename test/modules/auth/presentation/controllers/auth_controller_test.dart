import 'package:dartz/dartz.dart';
import 'package:flutter_boilerplate/core/common/failures.dart';
import 'package:flutter_boilerplate/modules/auth/presentation/controllers/auth_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/mockito.dart';

import '../../../../dummy_data/dummy_objects.dart';
import '../../../../helpers/test_helper.mocks.dart';

void main() {
  late AuthController controller;
  late MockAuthRepository mockAuthRepository;

  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    Get.testMode = true;

    mockAuthRepository = MockAuthRepository();
    controller = AuthController(mockAuthRepository);
  });

  group('authCheck', () {
    test(
        'isAuthenticated value should return true if user is already logged in',
        () async {
      // Arrange
      when(mockAuthRepository.validateAuth())
          .thenAnswer((_) async => const Right(tAuthValidateModel));
      // Act
      await controller.onInit();
      // Assert
      final result = controller.isAuthenticated.value;
      expect(result, true);
    });

    test('isAuthenticated value should return false if user is not logged in',
        () async {
      // Arrange
      when(mockAuthRepository.validateAuth()).thenAnswer(
          (_) async => const Left(ServerFailure(tBaseErrorResponse)));
      // Act
      await controller.onInit();
      // Assert
      final result = controller.isAuthenticated.value;
      expect(result, false);
    });
  });
}
