import 'package:dartz/dartz.dart';
import 'package:flutter_boilerplate/core/common/failures.dart';
import 'package:flutter_boilerplate/modules/user/presentation/controllers/user_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../dummy_data/dummy_objects.dart';
import '../../../../helpers/test_helper.mocks.dart';

void main() {
  late UserController controller;
  late MockUserRepository mockUserRepository;

  setUp(() {
    mockUserRepository = MockUserRepository();
    controller = UserController(mockUserRepository);
  });

  group('getUserById', () {
    const tUserId = 1;

    test('state should success when get user is successful', () async {
      // Arrange
      when(mockUserRepository.getUserById(tUserId))
          .thenAnswer((_) async => const Right(tUserModel));
      // Act
      controller.id = tUserId;
      await controller.onInit();
      // Assert
      final user = controller.state;
      final status = controller.status.isSuccess;

      expect(user, tUserModel);
      expect(status, true);
    });

    test('state should error when get user is unsuccessful', () async {
      // Arrange
      when(mockUserRepository.getUserById(tUserId)).thenAnswer(
          (_) async => const Left(ServerFailure(tBaseErrorResponse)));
      // Act
      controller.id = tUserId;
      await controller.onInit();
      // Assert
      final user = controller.state;
      final status = controller.status.isError;

      expect(user, null);
      expect(status, true);
    });
  });
}
