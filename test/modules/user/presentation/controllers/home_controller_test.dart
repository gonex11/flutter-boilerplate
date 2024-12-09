import 'package:dartz/dartz.dart';
import 'package:flutter_boilerplate/core/common/failures.dart';
import 'package:flutter_boilerplate/modules/user/data/models/user_model.dart';
import 'package:flutter_boilerplate/modules/user/presentation/controllers/home_controller.dart';
import 'package:flutter_boilerplate/shared/utils/result_state.dart';
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

  group('fetchUsers', () {
    test('state should initial when get users is successfully but no data',
        () async {
      // Arrange
      when(mockUserRepository.fetchUsers())
          .thenAnswer((_) async => const Right([]));
      // Act
      await controller.fetchUsers();
      // Assert
      final state = controller.usersState.value;
      expect(state, isA<ResultInitial>());
    });

    test('state should success when get users is successfully', () async {
      // Arrange
      when(mockUserRepository.fetchUsers())
          .thenAnswer((_) async => Right(tUserModels));
      // Act
      await controller.fetchUsers();
      // Assert
      final state = controller.usersState.value;
      expect(state, isA<ResultSuccess<List<UserModel>>>());
    });

    test('state should failed when get users is unsuccessfully', () async {
      // Arrange
      when(mockUserRepository.fetchUsers()).thenAnswer(
          (_) async => const Left(ServerFailure(tBaseErrorResponse)));
      // Act
      await controller.fetchUsers();
      // Assert
      final state = controller.usersState.value;
      expect(state, isA<ResultFailed>());
    });
  });

  group('logout', () {
    test('state should initial', () async {
      // Assert
      final state = controller.logoutState.value;
      expect(state, isA<ResultInitial>());
    });
    test('state should success when logout is successful', () async {
      // Arrange
      when(mockAuthRepository.logout()).thenAnswer((_) async => true);
      // Act
      await controller.logout();
      // Assert
      final state = controller.logoutState.value;
      expect(state, isA<ResultSuccess<bool>>());
    });
  });
}
