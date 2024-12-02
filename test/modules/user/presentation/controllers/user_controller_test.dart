import 'package:dartz/dartz.dart';
import 'package:flutter_boilerplate/core/common/failures.dart';
import 'package:flutter_boilerplate/modules/user/data/models/user_model.dart';
import 'package:flutter_boilerplate/modules/user/presentation/controllers/user_controller.dart';
import 'package:flutter_boilerplate/shared/utils/result_state.dart';
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

    test('state should initial', () async {
      // Assert
      final state = controller.userState.value;
      expect(state, isA<ResultInitial>());
    });

    test('state should success when get user is successful', () async {
      // Arrange
      when(mockUserRepository.getUserById(tUserId))
          .thenAnswer((_) async => const Right(tUserModel));
      // Act
      controller.id = tUserId;
      await controller.onInit();
      // Assert
      final state = controller.userState.value;
      expect(state, isA<ResultSuccess<UserModel>>());
    });

    test('state should failed when get user is unsuccessful', () async {
      // Arrange
      when(mockUserRepository.getUserById(tUserId)).thenAnswer(
          (_) async => const Left(ServerFailure(tBaseErrorResponse)));
      // Act
      controller.id = tUserId;
      await controller.onInit();
      // Assert
      final state = controller.userState.value;
      expect(state, isA<ResultFailed>());
    });
  });
}
