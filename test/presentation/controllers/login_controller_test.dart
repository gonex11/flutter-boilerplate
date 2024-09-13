import 'package:dartz/dartz.dart';
import 'package:flutter_boilerplate/core/common/failures.dart';
import 'package:flutter_boilerplate/presentation/controllers/login_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late LoginController controller;
  late MockAuthRepository mockAuthRepository;

  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    Get.testMode = true;

    mockAuthRepository = MockAuthRepository();
    controller = LoginController(mockAuthRepository);
  });

  tearDown(() {
    controller.dispose();
  });

  group('login', () {
    final tUsername = 'username';
    final tPassword = 'password';

    test('isLoggedIn value should return true if login is successful',
        () async {
      // Arrange
      when(mockAuthRepository.login(tUsername, tPassword))
          .thenAnswer((_) async => Right(tTokenModel));
      // Act
      await controller.login(tUsername, tPassword);
      // Assert
      final isLoading = controller.isLoading.value;
      final isLoggedIn = controller.isLoggedIn.value;

      expect(isLoading, false);
      expect(isLoggedIn, true);
    });

    test('isLoggedIn value should return false if login is unsuccessful',
        () async {
      // Arrange
      when(mockAuthRepository.login(tUsername, tPassword))
          .thenAnswer((_) async => Left(ServerFailure(tBaseErrorResponse)));
      // Act
      await controller.login(tUsername, tPassword);
      // Assert
      final isLoading = controller.isLoading.value;
      final isLoggedIn = controller.isLoggedIn.value;

      expect(isLoading, false);
      expect(isLoggedIn, false);
    });
  });
}
