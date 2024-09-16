import 'package:dartz/dartz.dart';
import 'package:flutter_boilerplate/core/common/failures.dart';
import 'package:flutter_boilerplate/presentation/controllers/create_user_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late CreateUserController controller;
  late MockUserRepository mockUserRepository;

  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    Get.testMode = true;

    mockUserRepository = MockUserRepository();
    controller = CreateUserController(mockUserRepository);
  });

  tearDown(() {
    controller.dispose();
  });

  group('createUser', () {
    test('isUserCreated value should return true if create user is successful',
        () async {
      // Arrange
      when(mockUserRepository.createUser(tUserPayload))
          .thenAnswer((_) async => const Right(tUserModel));
      // Act
      await controller.createUser(tUserPayload);
      // Assert
      final isLoading = controller.isLoading.value;
      final isUserCreated = controller.isUserCreated.value;

      expect(isLoading, false);
      expect(isUserCreated, true);
    });

    test(
        'isUserCreated value should return false if create user is unsuccessful',
        () async {
      // Arrange
      when(mockUserRepository.createUser(tUserPayload)).thenAnswer(
          (_) async => const Left(ServerFailure(tBaseErrorResponse)));
      // Act
      await controller.createUser(tUserPayload);
      // Assert
      final isLoading = controller.isLoading.value;
      final isUserCreated = controller.isUserCreated.value;

      expect(isLoading, false);
      expect(isUserCreated, false);
    });
  });
}
