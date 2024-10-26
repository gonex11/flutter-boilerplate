import 'package:dartz/dartz.dart';
import 'package:flutter_boilerplate/core/common/failures.dart';
import 'package:flutter_boilerplate/modules/user/presentation/controllers/home_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/mockito.dart';

import '../../../../dummy_data/dummy_objects.dart';
import '../../../../helpers/test_helper.mocks.dart';

void main() {
  late HomeController controller;
  late MockAuthRepository mockAuthRepository;
  late MockUserRepository mockUserRepository;

  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    Get.testMode = true;

    mockAuthRepository = MockAuthRepository();
    mockUserRepository = MockUserRepository();
    controller = HomeController(
      mockAuthRepository,
      mockUserRepository,
    );
  });

  group('getCacheUsers', () {
    test('state should success when get cache users is successfully', () async {
      // Arrange
      when(mockUserRepository.getCacheUsers()).thenAnswer((_) => tUserModels);
      // Act
      await controller.onInit();
      // Assert
      final users = controller.state;
      final status = controller.status.isSuccess;

      expect(users, tUserModels);
      expect(status, true);
    });

    test('should get users from remote when cache users is empty', () async {
      // Arrange
      when(mockUserRepository.getCacheUsers()).thenAnswer((_) => []);
      when(mockUserRepository.getUsers())
          .thenAnswer((_) async => Right(tUserModels));
      // Act
      await controller.getUsers();
      // Assert
      final users = controller.state;
      final status = controller.status.isSuccess;

      expect(users, tUserModels);
      expect(status, true);
    });

    test('state should success when get users from remote is successfully',
        () async {
      // Arrange
      when(mockUserRepository.getCacheUsers()).thenAnswer((_) => []);
      when(mockUserRepository.getUsers())
          .thenAnswer((_) async => Right(tUserModels));
      // Act
      await controller.getUsers();
      // Assert
      final users = controller.state;
      final status = controller.status.isSuccess;

      expect(users, tUserModels);
      expect(status, true);
    });

    test(
        'state should empty when get users from remote is successfully but the data is empty',
        () async {
      // Arrange
      when(mockUserRepository.getCacheUsers()).thenAnswer((_) => []);
      when(mockUserRepository.getUsers())
          .thenAnswer((_) async => const Right([]));
      // Act
      await controller.getUsers();
      // Assert
      final users = controller.state;
      final status = controller.status.isEmpty;

      expect(users, []);
      expect(status, true);
    });

    test('state should error when get users from remote is unsuccessfully',
        () async {
      // Arrange
      when(mockUserRepository.getCacheUsers()).thenAnswer((_) => []);
      when(mockUserRepository.getUsers()).thenAnswer(
          (_) async => const Left(ServerFailure(tBaseErrorResponse)));
      // Act
      await controller.getUsers();
      // Assert
      final users = controller.state;
      final status = controller.status.isError;

      expect(users, null);
      expect(status, true);
    });
  });

  group('logout', () {
    test('isLoggedOut value should be true when logout is successful',
        () async {
      // Arrange
      when(mockAuthRepository.logout()).thenAnswer((_) async => true);
      // Act
      await controller.logout();
      // Assert
      final result = controller.isLoggedOut.value;
      expect(result, true);
    });

    test('isLoggedOut value should be false when logout is successful',
        () async {
      // Arrange
      when(mockAuthRepository.logout()).thenAnswer((_) async => false);
      // Act
      await controller.logout();
      // Assert
      final result = controller.isLoggedOut.value;
      expect(result, false);
    });
  });
}
