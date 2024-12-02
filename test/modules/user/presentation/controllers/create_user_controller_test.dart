import 'package:dartz/dartz.dart';
import 'package:flutter_boilerplate/core/common/failures.dart';
import 'package:flutter_boilerplate/modules/user/data/models/user_model.dart';
import 'package:flutter_boilerplate/modules/user/presentation/controllers/create_user_controller.dart';
import 'package:flutter_boilerplate/shared/utils/result_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/mockito.dart';

import '../../../../dummy_data/dummy_objects.dart';
import '../../../../helpers/test_helper.mocks.dart';

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
    test('state should success when create user is successful', () async {
      // Assert
      final state = controller.createState.value;
      expect(state, isA<ResultInitial>());
    });

    test('state should success when create user is successful', () async {
      // Arrange
      when(mockUserRepository.createUser(tUserPayload))
          .thenAnswer((_) async => const Right(tUserModel));
      // Act
      controller.fNameController.text = tUserPayload.firstName ?? '';
      controller.lNameController.text = tUserPayload.lastName ?? '';
      controller.unameController.text = tUserPayload.username ?? '';
      controller.passController.text = tUserPayload.password ?? '';

      await controller.createUser();
      // Assert
      final state = controller.createState.value;
      expect(state, isA<ResultSuccess<UserModel>>());
    });

    test('state should failed when create user is unsuccessful', () async {
      // Arrange
      when(mockUserRepository.createUser(tUserPayload)).thenAnswer(
          (_) async => const Left(ServerFailure(tBaseErrorResponse)));
      // Act
      controller.fNameController.text = tUserPayload.firstName ?? '';
      controller.lNameController.text = tUserPayload.lastName ?? '';
      controller.unameController.text = tUserPayload.username ?? '';
      controller.passController.text = tUserPayload.password ?? '';

      await controller.createUser();
      // Assert
      final state = controller.createState.value;
      expect(state, isA<ResultFailed>());
    });
  });
}
