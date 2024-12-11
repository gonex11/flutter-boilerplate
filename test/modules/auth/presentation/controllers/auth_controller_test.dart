import 'package:dartz/dartz.dart';
import 'package:flutter_boilerplate/core/common/failures.dart';
import 'package:flutter_boilerplate/modules/auth/data/models/auth_validate_model.dart';
import 'package:flutter_boilerplate/modules/auth/presentation/controllers/auth_controller.dart';
import 'package:flutter_boilerplate/shared/utils/result_state.dart';
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
    test('state should initial', () async {
      // Assert
      final state = controller.authState.value;
      expect(state, isA<ResultInitial>());
    });

    test('state should success if user is already logged in', () async {
      // Arrange
      when(mockAuthRepository.validateAuth())
          .thenAnswer((_) async => const Right(tAuthValidateModel));
      // Act
      await controller.onInit();
      // Assert
      final state = controller.authState.value;
      expect(state, isA<ResultSuccess<AuthValidateModel>>());
    });

    test('state should failed if user is not logged in', () async {
      // Arrange
      when(mockAuthRepository.validateAuth()).thenAnswer(
          (_) async => const Left(ServerFailure(tBaseErrorResponse)));
      // Act
      await controller.onInit();
      // Assert
      final state = controller.authState.value;
      expect(state, isA<ResultFailed>());
    });
  });
}
