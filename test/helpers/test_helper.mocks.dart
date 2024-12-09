// Mocks generated by Mockito 5.4.4 from annotations
// in flutter_boilerplate/test/helpers/test_helper.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i9;
import 'dart:ui' as _i11;

import 'package:dartz/dartz.dart' as _i3;
import 'package:flutter/widgets.dart' as _i25;
import 'package:flutter_boilerplate/core/common/failures.dart' as _i13;
import 'package:flutter_boilerplate/core/common/network_info.dart' as _i27;
import 'package:flutter_boilerplate/core/common/token_manager.dart' as _i26;
import 'package:flutter_boilerplate/modules/auth/data/data_sources/local/auth_local_data_source.dart'
    as _i18;
import 'package:flutter_boilerplate/modules/auth/data/data_sources/remote/auth_remote_data_source.dart'
    as _i17;
import 'package:flutter_boilerplate/modules/auth/data/data_sources/remote/services/auth_service.dart'
    as _i23;
import 'package:flutter_boilerplate/modules/auth/data/models/login_payload.dart'
    as _i14;
import 'package:flutter_boilerplate/modules/auth/data/models/token_model.dart'
    as _i5;
import 'package:flutter_boilerplate/modules/auth/data/repositories/auth_repository.dart'
    as _i12;
import 'package:flutter_boilerplate/modules/user/data/data_sources/local/db/user_dao.dart'
    as _i21;
import 'package:flutter_boilerplate/modules/user/data/data_sources/local/entities/user_entity.dart'
    as _i22;
import 'package:flutter_boilerplate/modules/user/data/data_sources/local/user_local_data_source.dart'
    as _i20;
import 'package:flutter_boilerplate/modules/user/data/data_sources/remote/services/user_service.dart'
    as _i24;
import 'package:flutter_boilerplate/modules/user/data/data_sources/remote/user_remote_data_source.dart'
    as _i19;
import 'package:flutter_boilerplate/modules/user/data/models/user_model.dart'
    as _i4;
import 'package:flutter_boilerplate/modules/user/data/models/user_payload.dart'
    as _i16;
import 'package:flutter_boilerplate/modules/user/data/repositories/user_repository.dart'
    as _i15;
import 'package:flutter_boilerplate/modules/user/presentation/controllers/home_controller.dart'
    as _i7;
import 'package:flutter_boilerplate/shared/utils/result_state.dart' as _i8;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i6;
import 'package:get/get.dart' as _i2;
import 'package:get/get_state_manager/src/simple/list_notifier.dart' as _i10;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeRx_0<T> extends _i1.SmartFake implements _i2.Rx<T> {
  _FakeRx_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeInternalFinalCallback_1<T> extends _i1.SmartFake
    implements _i2.InternalFinalCallback<T> {
  _FakeInternalFinalCallback_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeEither_2<L, R> extends _i1.SmartFake implements _i3.Either<L, R> {
  _FakeEither_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeUserModel_3 extends _i1.SmartFake implements _i4.UserModel {
  _FakeUserModel_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeTokenModel_4 extends _i1.SmartFake implements _i5.TokenModel {
  _FakeTokenModel_4(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeIOSOptions_5 extends _i1.SmartFake implements _i6.IOSOptions {
  _FakeIOSOptions_5(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeAndroidOptions_6 extends _i1.SmartFake
    implements _i6.AndroidOptions {
  _FakeAndroidOptions_6(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeLinuxOptions_7 extends _i1.SmartFake implements _i6.LinuxOptions {
  _FakeLinuxOptions_7(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeWindowsOptions_8 extends _i1.SmartFake
    implements _i6.WindowsOptions {
  _FakeWindowsOptions_8(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeWebOptions_9 extends _i1.SmartFake implements _i6.WebOptions {
  _FakeWebOptions_9(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeMacOsOptions_10 extends _i1.SmartFake implements _i6.MacOsOptions {
  _FakeMacOsOptions_10(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [HomeController].
///
/// See the documentation for Mockito's code generation for more information.
class MockHomeController extends _i1.Mock implements _i7.HomeController {
  MockHomeController() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.Rx<_i8.ResultState<List<_i4.UserModel>>> get usersState =>
      (super.noSuchMethod(
        Invocation.getter(#usersState),
        returnValue: _FakeRx_0<_i8.ResultState<List<_i4.UserModel>>>(
          this,
          Invocation.getter(#usersState),
        ),
      ) as _i2.Rx<_i8.ResultState<List<_i4.UserModel>>>);

  @override
  _i2.Rx<_i8.ResultState<bool>> get logoutState => (super.noSuchMethod(
        Invocation.getter(#logoutState),
        returnValue: _FakeRx_0<_i8.ResultState<bool>>(
          this,
          Invocation.getter(#logoutState),
        ),
      ) as _i2.Rx<_i8.ResultState<bool>>);

  @override
  _i2.InternalFinalCallback<void> get onStart => (super.noSuchMethod(
        Invocation.getter(#onStart),
        returnValue: _FakeInternalFinalCallback_1<void>(
          this,
          Invocation.getter(#onStart),
        ),
      ) as _i2.InternalFinalCallback<void>);

  @override
  _i2.InternalFinalCallback<void> get onDelete => (super.noSuchMethod(
        Invocation.getter(#onDelete),
        returnValue: _FakeInternalFinalCallback_1<void>(
          this,
          Invocation.getter(#onDelete),
        ),
      ) as _i2.InternalFinalCallback<void>);

  @override
  bool get initialized => (super.noSuchMethod(
        Invocation.getter(#initialized),
        returnValue: false,
      ) as bool);

  @override
  bool get isClosed => (super.noSuchMethod(
        Invocation.getter(#isClosed),
        returnValue: false,
      ) as bool);

  @override
  bool get hasListeners => (super.noSuchMethod(
        Invocation.getter(#hasListeners),
        returnValue: false,
      ) as bool);

  @override
  int get listeners => (super.noSuchMethod(
        Invocation.getter(#listeners),
        returnValue: 0,
      ) as int);

  @override
  _i9.Future<void> onInit() => (super.noSuchMethod(
        Invocation.method(
          #onInit,
          [],
        ),
        returnValue: _i9.Future<void>.value(),
        returnValueForMissingStub: _i9.Future<void>.value(),
      ) as _i9.Future<void>);

  @override
  _i9.Future<void> fetchUsers([bool? refresh = false]) => (super.noSuchMethod(
        Invocation.method(
          #fetchUsers,
          [refresh],
        ),
        returnValue: _i9.Future<void>.value(),
        returnValueForMissingStub: _i9.Future<void>.value(),
      ) as _i9.Future<void>);

  @override
  _i9.Future<void> logout() => (super.noSuchMethod(
        Invocation.method(
          #logout,
          [],
        ),
        returnValue: _i9.Future<void>.value(),
        returnValueForMissingStub: _i9.Future<void>.value(),
      ) as _i9.Future<void>);

  @override
  void update([
    List<Object>? ids,
    bool? condition = true,
  ]) =>
      super.noSuchMethod(
        Invocation.method(
          #update,
          [
            ids,
            condition,
          ],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void onReady() => super.noSuchMethod(
        Invocation.method(
          #onReady,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void onClose() => super.noSuchMethod(
        Invocation.method(
          #onClose,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void $configureLifeCycle() => super.noSuchMethod(
        Invocation.method(
          #$configureLifeCycle,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i10.Disposer addListener(_i10.GetStateUpdate? listener) =>
      (super.noSuchMethod(
        Invocation.method(
          #addListener,
          [listener],
        ),
        returnValue: () {},
      ) as _i10.Disposer);

  @override
  void removeListener(_i11.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #removeListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void refresh() => super.noSuchMethod(
        Invocation.method(
          #refresh,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void refreshGroup(Object? id) => super.noSuchMethod(
        Invocation.method(
          #refreshGroup,
          [id],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void notifyChildrens() => super.noSuchMethod(
        Invocation.method(
          #notifyChildrens,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void removeListenerId(
    Object? id,
    _i11.VoidCallback? listener,
  ) =>
      super.noSuchMethod(
        Invocation.method(
          #removeListenerId,
          [
            id,
            listener,
          ],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void dispose() => super.noSuchMethod(
        Invocation.method(
          #dispose,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i10.Disposer addListenerId(
    Object? key,
    _i10.GetStateUpdate? listener,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #addListenerId,
          [
            key,
            listener,
          ],
        ),
        returnValue: () {},
      ) as _i10.Disposer);

  @override
  void disposeId(Object? id) => super.noSuchMethod(
        Invocation.method(
          #disposeId,
          [id],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [AuthRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockAuthRepository extends _i1.Mock implements _i12.AuthRepository {
  MockAuthRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i9.Future<_i3.Either<_i13.Failure, _i5.TokenModel>> login(
          _i14.LoginPayload? payload) =>
      (super.noSuchMethod(
        Invocation.method(
          #login,
          [payload],
        ),
        returnValue: _i9.Future<_i3.Either<_i13.Failure, _i5.TokenModel>>.value(
            _FakeEither_2<_i13.Failure, _i5.TokenModel>(
          this,
          Invocation.method(
            #login,
            [payload],
          ),
        )),
      ) as _i9.Future<_i3.Either<_i13.Failure, _i5.TokenModel>>);

  @override
  _i9.Future<_i3.Either<_i13.Failure, _i4.UserModel>> getLoggedUser() =>
      (super.noSuchMethod(
        Invocation.method(
          #getLoggedUser,
          [],
        ),
        returnValue: _i9.Future<_i3.Either<_i13.Failure, _i4.UserModel>>.value(
            _FakeEither_2<_i13.Failure, _i4.UserModel>(
          this,
          Invocation.method(
            #getLoggedUser,
            [],
          ),
        )),
      ) as _i9.Future<_i3.Either<_i13.Failure, _i4.UserModel>>);

  @override
  _i9.Future<bool> logout() => (super.noSuchMethod(
        Invocation.method(
          #logout,
          [],
        ),
        returnValue: _i9.Future<bool>.value(false),
      ) as _i9.Future<bool>);
}

/// A class which mocks [UserRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockUserRepository extends _i1.Mock implements _i15.UserRepository {
  MockUserRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i9.Future<_i3.Either<_i13.Failure, List<_i4.UserModel>>> fetchUsers() =>
      (super.noSuchMethod(
        Invocation.method(
          #fetchUsers,
          [],
        ),
        returnValue:
            _i9.Future<_i3.Either<_i13.Failure, List<_i4.UserModel>>>.value(
                _FakeEither_2<_i13.Failure, List<_i4.UserModel>>(
          this,
          Invocation.method(
            #fetchUsers,
            [],
          ),
        )),
      ) as _i9.Future<_i3.Either<_i13.Failure, List<_i4.UserModel>>>);

  @override
  _i9.Future<_i3.Either<_i13.Failure, _i4.UserModel>> getUserById(int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getUserById,
          [id],
        ),
        returnValue: _i9.Future<_i3.Either<_i13.Failure, _i4.UserModel>>.value(
            _FakeEither_2<_i13.Failure, _i4.UserModel>(
          this,
          Invocation.method(
            #getUserById,
            [id],
          ),
        )),
      ) as _i9.Future<_i3.Either<_i13.Failure, _i4.UserModel>>);

  @override
  _i9.Future<_i3.Either<_i13.Failure, _i4.UserModel>> addUser(
          _i16.UserPayload? payload) =>
      (super.noSuchMethod(
        Invocation.method(
          #addUser,
          [payload],
        ),
        returnValue: _i9.Future<_i3.Either<_i13.Failure, _i4.UserModel>>.value(
            _FakeEither_2<_i13.Failure, _i4.UserModel>(
          this,
          Invocation.method(
            #addUser,
            [payload],
          ),
        )),
      ) as _i9.Future<_i3.Either<_i13.Failure, _i4.UserModel>>);
}

/// A class which mocks [AuthRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockAuthRemoteDataSource extends _i1.Mock
    implements _i17.AuthRemoteDataSource {
  MockAuthRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i9.Future<_i4.UserModel> getLoggedUser() => (super.noSuchMethod(
        Invocation.method(
          #getLoggedUser,
          [],
        ),
        returnValue: _i9.Future<_i4.UserModel>.value(_FakeUserModel_3(
          this,
          Invocation.method(
            #getLoggedUser,
            [],
          ),
        )),
      ) as _i9.Future<_i4.UserModel>);

  @override
  _i9.Future<_i5.TokenModel> login(_i14.LoginPayload? payload) =>
      (super.noSuchMethod(
        Invocation.method(
          #login,
          [payload],
        ),
        returnValue: _i9.Future<_i5.TokenModel>.value(_FakeTokenModel_4(
          this,
          Invocation.method(
            #login,
            [payload],
          ),
        )),
      ) as _i9.Future<_i5.TokenModel>);

  @override
  _i9.Future<_i5.TokenModel> refreshToken(String? refreshToken) =>
      (super.noSuchMethod(
        Invocation.method(
          #refreshToken,
          [refreshToken],
        ),
        returnValue: _i9.Future<_i5.TokenModel>.value(_FakeTokenModel_4(
          this,
          Invocation.method(
            #refreshToken,
            [refreshToken],
          ),
        )),
      ) as _i9.Future<_i5.TokenModel>);
}

/// A class which mocks [AuthLocalDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockAuthLocalDataSource extends _i1.Mock
    implements _i18.AuthLocalDataSource {
  MockAuthLocalDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i9.Future<bool> isTokenExpired() => (super.noSuchMethod(
        Invocation.method(
          #isTokenExpired,
          [],
        ),
        returnValue: _i9.Future<bool>.value(false),
      ) as _i9.Future<bool>);

  @override
  _i9.Future<bool> setUserSession(_i4.UserModel? user) => (super.noSuchMethod(
        Invocation.method(
          #setUserSession,
          [user],
        ),
        returnValue: _i9.Future<bool>.value(false),
      ) as _i9.Future<bool>);

  @override
  _i9.Future<_i4.UserModel?> getUserSession() => (super.noSuchMethod(
        Invocation.method(
          #getUserSession,
          [],
        ),
        returnValue: _i9.Future<_i4.UserModel?>.value(),
      ) as _i9.Future<_i4.UserModel?>);

  @override
  _i9.Future<bool> setToken(_i5.TokenModel? tokenResponse) =>
      (super.noSuchMethod(
        Invocation.method(
          #setToken,
          [tokenResponse],
        ),
        returnValue: _i9.Future<bool>.value(false),
      ) as _i9.Future<bool>);

  @override
  _i9.Future<String?> getAccessToken() => (super.noSuchMethod(
        Invocation.method(
          #getAccessToken,
          [],
        ),
        returnValue: _i9.Future<String?>.value(),
      ) as _i9.Future<String?>);

  @override
  _i9.Future<String?> getRefreshToken() => (super.noSuchMethod(
        Invocation.method(
          #getRefreshToken,
          [],
        ),
        returnValue: _i9.Future<String?>.value(),
      ) as _i9.Future<String?>);

  @override
  _i9.Future<bool> clearSession() => (super.noSuchMethod(
        Invocation.method(
          #clearSession,
          [],
        ),
        returnValue: _i9.Future<bool>.value(false),
      ) as _i9.Future<bool>);
}

/// A class which mocks [UserRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockUserRemoteDataSource extends _i1.Mock
    implements _i19.UserRemoteDataSource {
  MockUserRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i9.Future<List<_i4.UserModel>> fetchUsers() => (super.noSuchMethod(
        Invocation.method(
          #fetchUsers,
          [],
        ),
        returnValue: _i9.Future<List<_i4.UserModel>>.value(<_i4.UserModel>[]),
      ) as _i9.Future<List<_i4.UserModel>>);

  @override
  _i9.Future<_i4.UserModel> getUserById(int? id) => (super.noSuchMethod(
        Invocation.method(
          #getUserById,
          [id],
        ),
        returnValue: _i9.Future<_i4.UserModel>.value(_FakeUserModel_3(
          this,
          Invocation.method(
            #getUserById,
            [id],
          ),
        )),
      ) as _i9.Future<_i4.UserModel>);

  @override
  _i9.Future<_i4.UserModel> addUser(_i16.UserPayload? payload) =>
      (super.noSuchMethod(
        Invocation.method(
          #addUser,
          [payload],
        ),
        returnValue: _i9.Future<_i4.UserModel>.value(_FakeUserModel_3(
          this,
          Invocation.method(
            #addUser,
            [payload],
          ),
        )),
      ) as _i9.Future<_i4.UserModel>);
}

/// A class which mocks [UserLocalDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockUserLocalDataSource extends _i1.Mock
    implements _i20.UserLocalDataSource {
  MockUserLocalDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i9.Future<List<_i4.UserModel>> getCachedUsers() => (super.noSuchMethod(
        Invocation.method(
          #getCachedUsers,
          [],
        ),
        returnValue: _i9.Future<List<_i4.UserModel>>.value(<_i4.UserModel>[]),
      ) as _i9.Future<List<_i4.UserModel>>);

  @override
  _i9.Future<bool> cacheUsers(List<_i4.UserModel>? users) =>
      (super.noSuchMethod(
        Invocation.method(
          #cacheUsers,
          [users],
        ),
        returnValue: _i9.Future<bool>.value(false),
      ) as _i9.Future<bool>);
}

/// A class which mocks [UserDao].
///
/// See the documentation for Mockito's code generation for more information.
class MockUserDao extends _i1.Mock implements _i21.UserDao {
  MockUserDao() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i9.Future<List<_i22.UserEntity>> getAll() => (super.noSuchMethod(
        Invocation.method(
          #getAll,
          [],
        ),
        returnValue:
            _i9.Future<List<_i22.UserEntity>>.value(<_i22.UserEntity>[]),
      ) as _i9.Future<List<_i22.UserEntity>>);

  @override
  _i9.Future<void> insertAll(List<_i22.UserEntity>? users) =>
      (super.noSuchMethod(
        Invocation.method(
          #insertAll,
          [users],
        ),
        returnValue: _i9.Future<void>.value(),
        returnValueForMissingStub: _i9.Future<void>.value(),
      ) as _i9.Future<void>);
}

/// A class which mocks [AuthService].
///
/// See the documentation for Mockito's code generation for more information.
class MockAuthService extends _i1.Mock implements _i23.AuthService {
  MockAuthService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i9.Future<_i4.UserModel> getLoggedUser() => (super.noSuchMethod(
        Invocation.method(
          #getLoggedUser,
          [],
        ),
        returnValue: _i9.Future<_i4.UserModel>.value(_FakeUserModel_3(
          this,
          Invocation.method(
            #getLoggedUser,
            [],
          ),
        )),
      ) as _i9.Future<_i4.UserModel>);

  @override
  _i9.Future<_i5.TokenModel> login(_i14.LoginPayload? payload) =>
      (super.noSuchMethod(
        Invocation.method(
          #login,
          [payload],
        ),
        returnValue: _i9.Future<_i5.TokenModel>.value(_FakeTokenModel_4(
          this,
          Invocation.method(
            #login,
            [payload],
          ),
        )),
      ) as _i9.Future<_i5.TokenModel>);

  @override
  _i9.Future<_i5.TokenModel> refreshToken(String? token) => (super.noSuchMethod(
        Invocation.method(
          #refreshToken,
          [token],
        ),
        returnValue: _i9.Future<_i5.TokenModel>.value(_FakeTokenModel_4(
          this,
          Invocation.method(
            #refreshToken,
            [token],
          ),
        )),
      ) as _i9.Future<_i5.TokenModel>);
}

/// A class which mocks [UserService].
///
/// See the documentation for Mockito's code generation for more information.
class MockUserService extends _i1.Mock implements _i24.UserService {
  MockUserService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i9.Future<List<_i4.UserModel>> fetchUsers() => (super.noSuchMethod(
        Invocation.method(
          #fetchUsers,
          [],
        ),
        returnValue: _i9.Future<List<_i4.UserModel>>.value(<_i4.UserModel>[]),
      ) as _i9.Future<List<_i4.UserModel>>);

  @override
  _i9.Future<_i4.UserModel> getUserById(int? id) => (super.noSuchMethod(
        Invocation.method(
          #getUserById,
          [id],
        ),
        returnValue: _i9.Future<_i4.UserModel>.value(_FakeUserModel_3(
          this,
          Invocation.method(
            #getUserById,
            [id],
          ),
        )),
      ) as _i9.Future<_i4.UserModel>);

  @override
  _i9.Future<_i4.UserModel> addUser(_i16.UserPayload? payload) =>
      (super.noSuchMethod(
        Invocation.method(
          #addUser,
          [payload],
        ),
        returnValue: _i9.Future<_i4.UserModel>.value(_FakeUserModel_3(
          this,
          Invocation.method(
            #addUser,
            [payload],
          ),
        )),
      ) as _i9.Future<_i4.UserModel>);
}

/// A class which mocks [FlutterSecureStorage].
///
/// See the documentation for Mockito's code generation for more information.
class MockFlutterSecureStorage extends _i1.Mock
    implements _i6.FlutterSecureStorage {
  MockFlutterSecureStorage() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.IOSOptions get iOptions => (super.noSuchMethod(
        Invocation.getter(#iOptions),
        returnValue: _FakeIOSOptions_5(
          this,
          Invocation.getter(#iOptions),
        ),
      ) as _i6.IOSOptions);

  @override
  _i6.AndroidOptions get aOptions => (super.noSuchMethod(
        Invocation.getter(#aOptions),
        returnValue: _FakeAndroidOptions_6(
          this,
          Invocation.getter(#aOptions),
        ),
      ) as _i6.AndroidOptions);

  @override
  _i6.LinuxOptions get lOptions => (super.noSuchMethod(
        Invocation.getter(#lOptions),
        returnValue: _FakeLinuxOptions_7(
          this,
          Invocation.getter(#lOptions),
        ),
      ) as _i6.LinuxOptions);

  @override
  _i6.WindowsOptions get wOptions => (super.noSuchMethod(
        Invocation.getter(#wOptions),
        returnValue: _FakeWindowsOptions_8(
          this,
          Invocation.getter(#wOptions),
        ),
      ) as _i6.WindowsOptions);

  @override
  _i6.WebOptions get webOptions => (super.noSuchMethod(
        Invocation.getter(#webOptions),
        returnValue: _FakeWebOptions_9(
          this,
          Invocation.getter(#webOptions),
        ),
      ) as _i6.WebOptions);

  @override
  _i6.MacOsOptions get mOptions => (super.noSuchMethod(
        Invocation.getter(#mOptions),
        returnValue: _FakeMacOsOptions_10(
          this,
          Invocation.getter(#mOptions),
        ),
      ) as _i6.MacOsOptions);

  @override
  void registerListener({
    required String? key,
    required _i25.ValueChanged<String?>? listener,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #registerListener,
          [],
          {
            #key: key,
            #listener: listener,
          },
        ),
        returnValueForMissingStub: null,
      );

  @override
  void unregisterListener({
    required String? key,
    required _i25.ValueChanged<String?>? listener,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #unregisterListener,
          [],
          {
            #key: key,
            #listener: listener,
          },
        ),
        returnValueForMissingStub: null,
      );

  @override
  void unregisterAllListenersForKey({required String? key}) =>
      super.noSuchMethod(
        Invocation.method(
          #unregisterAllListenersForKey,
          [],
          {#key: key},
        ),
        returnValueForMissingStub: null,
      );

  @override
  void unregisterAllListeners() => super.noSuchMethod(
        Invocation.method(
          #unregisterAllListeners,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i9.Future<void> write({
    required String? key,
    required String? value,
    _i6.IOSOptions? iOptions,
    _i6.AndroidOptions? aOptions,
    _i6.LinuxOptions? lOptions,
    _i6.WebOptions? webOptions,
    _i6.MacOsOptions? mOptions,
    _i6.WindowsOptions? wOptions,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #write,
          [],
          {
            #key: key,
            #value: value,
            #iOptions: iOptions,
            #aOptions: aOptions,
            #lOptions: lOptions,
            #webOptions: webOptions,
            #mOptions: mOptions,
            #wOptions: wOptions,
          },
        ),
        returnValue: _i9.Future<void>.value(),
        returnValueForMissingStub: _i9.Future<void>.value(),
      ) as _i9.Future<void>);

  @override
  _i9.Future<String?> read({
    required String? key,
    _i6.IOSOptions? iOptions,
    _i6.AndroidOptions? aOptions,
    _i6.LinuxOptions? lOptions,
    _i6.WebOptions? webOptions,
    _i6.MacOsOptions? mOptions,
    _i6.WindowsOptions? wOptions,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #read,
          [],
          {
            #key: key,
            #iOptions: iOptions,
            #aOptions: aOptions,
            #lOptions: lOptions,
            #webOptions: webOptions,
            #mOptions: mOptions,
            #wOptions: wOptions,
          },
        ),
        returnValue: _i9.Future<String?>.value(),
      ) as _i9.Future<String?>);

  @override
  _i9.Future<bool> containsKey({
    required String? key,
    _i6.IOSOptions? iOptions,
    _i6.AndroidOptions? aOptions,
    _i6.LinuxOptions? lOptions,
    _i6.WebOptions? webOptions,
    _i6.MacOsOptions? mOptions,
    _i6.WindowsOptions? wOptions,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #containsKey,
          [],
          {
            #key: key,
            #iOptions: iOptions,
            #aOptions: aOptions,
            #lOptions: lOptions,
            #webOptions: webOptions,
            #mOptions: mOptions,
            #wOptions: wOptions,
          },
        ),
        returnValue: _i9.Future<bool>.value(false),
      ) as _i9.Future<bool>);

  @override
  _i9.Future<void> delete({
    required String? key,
    _i6.IOSOptions? iOptions,
    _i6.AndroidOptions? aOptions,
    _i6.LinuxOptions? lOptions,
    _i6.WebOptions? webOptions,
    _i6.MacOsOptions? mOptions,
    _i6.WindowsOptions? wOptions,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #delete,
          [],
          {
            #key: key,
            #iOptions: iOptions,
            #aOptions: aOptions,
            #lOptions: lOptions,
            #webOptions: webOptions,
            #mOptions: mOptions,
            #wOptions: wOptions,
          },
        ),
        returnValue: _i9.Future<void>.value(),
        returnValueForMissingStub: _i9.Future<void>.value(),
      ) as _i9.Future<void>);

  @override
  _i9.Future<Map<String, String>> readAll({
    _i6.IOSOptions? iOptions,
    _i6.AndroidOptions? aOptions,
    _i6.LinuxOptions? lOptions,
    _i6.WebOptions? webOptions,
    _i6.MacOsOptions? mOptions,
    _i6.WindowsOptions? wOptions,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #readAll,
          [],
          {
            #iOptions: iOptions,
            #aOptions: aOptions,
            #lOptions: lOptions,
            #webOptions: webOptions,
            #mOptions: mOptions,
            #wOptions: wOptions,
          },
        ),
        returnValue: _i9.Future<Map<String, String>>.value(<String, String>{}),
      ) as _i9.Future<Map<String, String>>);

  @override
  _i9.Future<void> deleteAll({
    _i6.IOSOptions? iOptions,
    _i6.AndroidOptions? aOptions,
    _i6.LinuxOptions? lOptions,
    _i6.WebOptions? webOptions,
    _i6.MacOsOptions? mOptions,
    _i6.WindowsOptions? wOptions,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #deleteAll,
          [],
          {
            #iOptions: iOptions,
            #aOptions: aOptions,
            #lOptions: lOptions,
            #webOptions: webOptions,
            #mOptions: mOptions,
            #wOptions: wOptions,
          },
        ),
        returnValue: _i9.Future<void>.value(),
        returnValueForMissingStub: _i9.Future<void>.value(),
      ) as _i9.Future<void>);

  @override
  _i9.Future<bool?> isCupertinoProtectedDataAvailable() => (super.noSuchMethod(
        Invocation.method(
          #isCupertinoProtectedDataAvailable,
          [],
        ),
        returnValue: _i9.Future<bool?>.value(),
      ) as _i9.Future<bool?>);
}

/// A class which mocks [TokenManager].
///
/// See the documentation for Mockito's code generation for more information.
class MockTokenManager extends _i1.Mock implements _i26.TokenManager {
  MockTokenManager() {
    _i1.throwOnMissingStub(this);
  }

  @override
  bool isTokenExpired(String? token) => (super.noSuchMethod(
        Invocation.method(
          #isTokenExpired,
          [token],
        ),
        returnValue: false,
      ) as bool);
}

/// A class which mocks [NetworkInfo].
///
/// See the documentation for Mockito's code generation for more information.
class MockNetworkInfo extends _i1.Mock implements _i27.NetworkInfo {
  MockNetworkInfo() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i9.Future<bool> get isConnected => (super.noSuchMethod(
        Invocation.getter(#isConnected),
        returnValue: _i9.Future<bool>.value(false),
      ) as _i9.Future<bool>);

  @override
  _i9.Stream<bool> get onConnectivityChanged => (super.noSuchMethod(
        Invocation.getter(#onConnectivityChanged),
        returnValue: _i9.Stream<bool>.empty(),
      ) as _i9.Stream<bool>);
}
