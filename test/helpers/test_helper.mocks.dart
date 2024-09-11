// Mocks generated by Mockito 5.4.4 from annotations
// in flutter_boilerplate/test/helpers/test_helper.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i11;

import 'package:dartz/dartz.dart' as _i2;
import 'package:dio/src/adapter.dart' as _i6;
import 'package:dio/src/cancel_token.dart' as _i24;
import 'package:dio/src/dio.dart' as _i23;
import 'package:dio/src/dio_mixin.dart' as _i8;
import 'package:dio/src/options.dart' as _i5;
import 'package:dio/src/response.dart' as _i9;
import 'package:dio/src/transformer.dart' as _i7;
import 'package:flutter_boilerplate/core/common/failures.dart' as _i12;
import 'package:flutter_boilerplate/core/common/token_manager.dart' as _i22;
import 'package:flutter_boilerplate/data/data_sources/local/auth_local_data_source.dart'
    as _i16;
import 'package:flutter_boilerplate/data/data_sources/local/db/boxes/users_box.dart'
    as _i19;
import 'package:flutter_boilerplate/data/data_sources/local/db/secure_storage.dart'
    as _i21;
import 'package:flutter_boilerplate/data/data_sources/local/user_local_data_source.dart'
    as _i18;
import 'package:flutter_boilerplate/data/data_sources/remote/auth_remote_data_source.dart'
    as _i15;
import 'package:flutter_boilerplate/data/data_sources/remote/user_remote_data_source.dart'
    as _i17;
import 'package:flutter_boilerplate/data/models/token_model.dart' as _i4;
import 'package:flutter_boilerplate/data/models/user_model.dart' as _i3;
import 'package:flutter_boilerplate/data/models/user_payload.dart' as _i14;
import 'package:flutter_boilerplate/data/models/user_type.dart' as _i20;
import 'package:flutter_boilerplate/data/repositories/auth_repository.dart'
    as _i10;
import 'package:flutter_boilerplate/data/repositories/user_repository.dart'
    as _i13;
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

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeUserModel_1 extends _i1.SmartFake implements _i3.UserModel {
  _FakeUserModel_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeTokenModel_2 extends _i1.SmartFake implements _i4.TokenModel {
  _FakeTokenModel_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeBaseOptions_3 extends _i1.SmartFake implements _i5.BaseOptions {
  _FakeBaseOptions_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeHttpClientAdapter_4 extends _i1.SmartFake
    implements _i6.HttpClientAdapter {
  _FakeHttpClientAdapter_4(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeTransformer_5 extends _i1.SmartFake implements _i7.Transformer {
  _FakeTransformer_5(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeInterceptors_6 extends _i1.SmartFake implements _i8.Interceptors {
  _FakeInterceptors_6(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeResponse_7<T1> extends _i1.SmartFake implements _i9.Response<T1> {
  _FakeResponse_7(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [AuthRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockAuthRepository extends _i1.Mock implements _i10.AuthRepository {
  MockAuthRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i11.Future<_i2.Either<_i12.Failure, _i4.TokenModel>> login(
    String? username,
    String? password,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #login,
          [
            username,
            password,
          ],
        ),
        returnValue:
            _i11.Future<_i2.Either<_i12.Failure, _i4.TokenModel>>.value(
                _FakeEither_0<_i12.Failure, _i4.TokenModel>(
          this,
          Invocation.method(
            #login,
            [
              username,
              password,
            ],
          ),
        )),
      ) as _i11.Future<_i2.Either<_i12.Failure, _i4.TokenModel>>);

  @override
  _i11.Future<_i2.Either<_i12.Failure, _i3.UserModel>> getLoggedUser() =>
      (super.noSuchMethod(
        Invocation.method(
          #getLoggedUser,
          [],
        ),
        returnValue: _i11.Future<_i2.Either<_i12.Failure, _i3.UserModel>>.value(
            _FakeEither_0<_i12.Failure, _i3.UserModel>(
          this,
          Invocation.method(
            #getLoggedUser,
            [],
          ),
        )),
      ) as _i11.Future<_i2.Either<_i12.Failure, _i3.UserModel>>);

  @override
  _i11.Future<bool> logout() => (super.noSuchMethod(
        Invocation.method(
          #logout,
          [],
        ),
        returnValue: _i11.Future<bool>.value(false),
      ) as _i11.Future<bool>);
}

/// A class which mocks [UserRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockUserRepository extends _i1.Mock implements _i13.UserRepository {
  MockUserRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i11.Future<_i2.Either<_i12.Failure, List<_i3.UserModel>>> getUsers() =>
      (super.noSuchMethod(
        Invocation.method(
          #getUsers,
          [],
        ),
        returnValue:
            _i11.Future<_i2.Either<_i12.Failure, List<_i3.UserModel>>>.value(
                _FakeEither_0<_i12.Failure, List<_i3.UserModel>>(
          this,
          Invocation.method(
            #getUsers,
            [],
          ),
        )),
      ) as _i11.Future<_i2.Either<_i12.Failure, List<_i3.UserModel>>>);

  @override
  _i11.Future<List<_i3.UserModel>> getCacheUsers() => (super.noSuchMethod(
        Invocation.method(
          #getCacheUsers,
          [],
        ),
        returnValue: _i11.Future<List<_i3.UserModel>>.value(<_i3.UserModel>[]),
      ) as _i11.Future<List<_i3.UserModel>>);

  @override
  _i11.Future<_i2.Either<_i12.Failure, _i3.UserModel>> getUserById(int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getUserById,
          [id],
        ),
        returnValue: _i11.Future<_i2.Either<_i12.Failure, _i3.UserModel>>.value(
            _FakeEither_0<_i12.Failure, _i3.UserModel>(
          this,
          Invocation.method(
            #getUserById,
            [id],
          ),
        )),
      ) as _i11.Future<_i2.Either<_i12.Failure, _i3.UserModel>>);

  @override
  _i11.Future<_i2.Either<_i12.Failure, _i3.UserModel>> createUser(
          _i14.UserPayload? payload) =>
      (super.noSuchMethod(
        Invocation.method(
          #createUser,
          [payload],
        ),
        returnValue: _i11.Future<_i2.Either<_i12.Failure, _i3.UserModel>>.value(
            _FakeEither_0<_i12.Failure, _i3.UserModel>(
          this,
          Invocation.method(
            #createUser,
            [payload],
          ),
        )),
      ) as _i11.Future<_i2.Either<_i12.Failure, _i3.UserModel>>);
}

/// A class which mocks [AuthRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockAuthRemoteDataSource extends _i1.Mock
    implements _i15.AuthRemoteDataSource {
  MockAuthRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i11.Future<_i3.UserModel> getLoggedUser() => (super.noSuchMethod(
        Invocation.method(
          #getLoggedUser,
          [],
        ),
        returnValue: _i11.Future<_i3.UserModel>.value(_FakeUserModel_1(
          this,
          Invocation.method(
            #getLoggedUser,
            [],
          ),
        )),
      ) as _i11.Future<_i3.UserModel>);

  @override
  _i11.Future<_i4.TokenModel> login(
    String? username,
    String? password,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #login,
          [
            username,
            password,
          ],
        ),
        returnValue: _i11.Future<_i4.TokenModel>.value(_FakeTokenModel_2(
          this,
          Invocation.method(
            #login,
            [
              username,
              password,
            ],
          ),
        )),
      ) as _i11.Future<_i4.TokenModel>);

  @override
  _i11.Future<_i4.TokenModel> refreshToken(String? refreshToken) =>
      (super.noSuchMethod(
        Invocation.method(
          #refreshToken,
          [refreshToken],
        ),
        returnValue: _i11.Future<_i4.TokenModel>.value(_FakeTokenModel_2(
          this,
          Invocation.method(
            #refreshToken,
            [refreshToken],
          ),
        )),
      ) as _i11.Future<_i4.TokenModel>);
}

/// A class which mocks [AuthLocalDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockAuthLocalDataSource extends _i1.Mock
    implements _i16.AuthLocalDataSource {
  MockAuthLocalDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i11.Future<bool> isTokenExpired() => (super.noSuchMethod(
        Invocation.method(
          #isTokenExpired,
          [],
        ),
        returnValue: _i11.Future<bool>.value(false),
      ) as _i11.Future<bool>);

  @override
  _i11.Future<bool> setUserSession(_i3.UserModel? user) => (super.noSuchMethod(
        Invocation.method(
          #setUserSession,
          [user],
        ),
        returnValue: _i11.Future<bool>.value(false),
      ) as _i11.Future<bool>);

  @override
  _i11.Future<_i3.UserModel?> getUserSession() => (super.noSuchMethod(
        Invocation.method(
          #getUserSession,
          [],
        ),
        returnValue: _i11.Future<_i3.UserModel?>.value(),
      ) as _i11.Future<_i3.UserModel?>);

  @override
  _i11.Future<bool> setToken(_i4.TokenModel? tokenResponse) =>
      (super.noSuchMethod(
        Invocation.method(
          #setToken,
          [tokenResponse],
        ),
        returnValue: _i11.Future<bool>.value(false),
      ) as _i11.Future<bool>);

  @override
  _i11.Future<String?> getAccessToken() => (super.noSuchMethod(
        Invocation.method(
          #getAccessToken,
          [],
        ),
        returnValue: _i11.Future<String?>.value(),
      ) as _i11.Future<String?>);

  @override
  _i11.Future<String?> getRefreshToken() => (super.noSuchMethod(
        Invocation.method(
          #getRefreshToken,
          [],
        ),
        returnValue: _i11.Future<String?>.value(),
      ) as _i11.Future<String?>);

  @override
  _i11.Future<bool> clearSession() => (super.noSuchMethod(
        Invocation.method(
          #clearSession,
          [],
        ),
        returnValue: _i11.Future<bool>.value(false),
      ) as _i11.Future<bool>);
}

/// A class which mocks [UserRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockUserRemoteDataSource extends _i1.Mock
    implements _i17.UserRemoteDataSource {
  MockUserRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i11.Future<List<_i3.UserModel>> getUsers() => (super.noSuchMethod(
        Invocation.method(
          #getUsers,
          [],
        ),
        returnValue: _i11.Future<List<_i3.UserModel>>.value(<_i3.UserModel>[]),
      ) as _i11.Future<List<_i3.UserModel>>);

  @override
  _i11.Future<_i3.UserModel> getUserById(int? id) => (super.noSuchMethod(
        Invocation.method(
          #getUserById,
          [id],
        ),
        returnValue: _i11.Future<_i3.UserModel>.value(_FakeUserModel_1(
          this,
          Invocation.method(
            #getUserById,
            [id],
          ),
        )),
      ) as _i11.Future<_i3.UserModel>);

  @override
  _i11.Future<_i3.UserModel> createUser(_i14.UserPayload? payload) =>
      (super.noSuchMethod(
        Invocation.method(
          #createUser,
          [payload],
        ),
        returnValue: _i11.Future<_i3.UserModel>.value(_FakeUserModel_1(
          this,
          Invocation.method(
            #createUser,
            [payload],
          ),
        )),
      ) as _i11.Future<_i3.UserModel>);
}

/// A class which mocks [UserLocalDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockUserLocalDataSource extends _i1.Mock
    implements _i18.UserLocalDataSource {
  MockUserLocalDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i11.Future<int> cacheUsers(List<_i3.UserModel>? users) =>
      (super.noSuchMethod(
        Invocation.method(
          #cacheUsers,
          [users],
        ),
        returnValue: _i11.Future<int>.value(0),
      ) as _i11.Future<int>);

  @override
  _i11.Future<List<_i3.UserModel>> getCachedUsers() => (super.noSuchMethod(
        Invocation.method(
          #getCachedUsers,
          [],
        ),
        returnValue: _i11.Future<List<_i3.UserModel>>.value(<_i3.UserModel>[]),
      ) as _i11.Future<List<_i3.UserModel>>);
}

/// A class which mocks [UsersBox].
///
/// See the documentation for Mockito's code generation for more information.
class MockUsersBox extends _i1.Mock implements _i19.UsersBox {
  MockUsersBox() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i11.Future<int> insertCache(List<_i20.UserType>? users) =>
      (super.noSuchMethod(
        Invocation.method(
          #insertCache,
          [users],
        ),
        returnValue: _i11.Future<int>.value(0),
      ) as _i11.Future<int>);
}

/// A class which mocks [SecureStorage].
///
/// See the documentation for Mockito's code generation for more information.
class MockSecureStorage extends _i1.Mock implements _i21.SecureStorage {
  MockSecureStorage() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i11.Future<String?> read(String? key) => (super.noSuchMethod(
        Invocation.method(
          #read,
          [key],
        ),
        returnValue: _i11.Future<String?>.value(),
      ) as _i11.Future<String?>);

  @override
  _i11.Future<bool> write(
    String? key,
    String? value,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #write,
          [
            key,
            value,
          ],
        ),
        returnValue: _i11.Future<bool>.value(false),
      ) as _i11.Future<bool>);

  @override
  _i11.Future<bool> delete(String? key) => (super.noSuchMethod(
        Invocation.method(
          #delete,
          [key],
        ),
        returnValue: _i11.Future<bool>.value(false),
      ) as _i11.Future<bool>);
}

/// A class which mocks [TokenManager].
///
/// See the documentation for Mockito's code generation for more information.
class MockTokenManager extends _i1.Mock implements _i22.TokenManager {
  MockTokenManager() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i11.Future<bool> isTokenExpired(String? token) => (super.noSuchMethod(
        Invocation.method(
          #isTokenExpired,
          [token],
        ),
        returnValue: _i11.Future<bool>.value(false),
      ) as _i11.Future<bool>);
}

/// A class which mocks [Dio].
///
/// See the documentation for Mockito's code generation for more information.
class MockDio extends _i1.Mock implements _i23.Dio {
  MockDio() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.BaseOptions get options => (super.noSuchMethod(
        Invocation.getter(#options),
        returnValue: _FakeBaseOptions_3(
          this,
          Invocation.getter(#options),
        ),
      ) as _i5.BaseOptions);

  @override
  set options(_i5.BaseOptions? _options) => super.noSuchMethod(
        Invocation.setter(
          #options,
          _options,
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i6.HttpClientAdapter get httpClientAdapter => (super.noSuchMethod(
        Invocation.getter(#httpClientAdapter),
        returnValue: _FakeHttpClientAdapter_4(
          this,
          Invocation.getter(#httpClientAdapter),
        ),
      ) as _i6.HttpClientAdapter);

  @override
  set httpClientAdapter(_i6.HttpClientAdapter? _httpClientAdapter) =>
      super.noSuchMethod(
        Invocation.setter(
          #httpClientAdapter,
          _httpClientAdapter,
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i7.Transformer get transformer => (super.noSuchMethod(
        Invocation.getter(#transformer),
        returnValue: _FakeTransformer_5(
          this,
          Invocation.getter(#transformer),
        ),
      ) as _i7.Transformer);

  @override
  set transformer(_i7.Transformer? _transformer) => super.noSuchMethod(
        Invocation.setter(
          #transformer,
          _transformer,
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i8.Interceptors get interceptors => (super.noSuchMethod(
        Invocation.getter(#interceptors),
        returnValue: _FakeInterceptors_6(
          this,
          Invocation.getter(#interceptors),
        ),
      ) as _i8.Interceptors);

  @override
  void close({bool? force = false}) => super.noSuchMethod(
        Invocation.method(
          #close,
          [],
          {#force: force},
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i11.Future<_i9.Response<T>> head<T>(
    String? path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    _i5.Options? options,
    _i24.CancelToken? cancelToken,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #head,
          [path],
          {
            #data: data,
            #queryParameters: queryParameters,
            #options: options,
            #cancelToken: cancelToken,
          },
        ),
        returnValue: _i11.Future<_i9.Response<T>>.value(_FakeResponse_7<T>(
          this,
          Invocation.method(
            #head,
            [path],
            {
              #data: data,
              #queryParameters: queryParameters,
              #options: options,
              #cancelToken: cancelToken,
            },
          ),
        )),
      ) as _i11.Future<_i9.Response<T>>);

  @override
  _i11.Future<_i9.Response<T>> headUri<T>(
    Uri? uri, {
    Object? data,
    _i5.Options? options,
    _i24.CancelToken? cancelToken,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #headUri,
          [uri],
          {
            #data: data,
            #options: options,
            #cancelToken: cancelToken,
          },
        ),
        returnValue: _i11.Future<_i9.Response<T>>.value(_FakeResponse_7<T>(
          this,
          Invocation.method(
            #headUri,
            [uri],
            {
              #data: data,
              #options: options,
              #cancelToken: cancelToken,
            },
          ),
        )),
      ) as _i11.Future<_i9.Response<T>>);

  @override
  _i11.Future<_i9.Response<T>> get<T>(
    String? path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    _i5.Options? options,
    _i24.CancelToken? cancelToken,
    _i5.ProgressCallback? onReceiveProgress,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #get,
          [path],
          {
            #data: data,
            #queryParameters: queryParameters,
            #options: options,
            #cancelToken: cancelToken,
            #onReceiveProgress: onReceiveProgress,
          },
        ),
        returnValue: _i11.Future<_i9.Response<T>>.value(_FakeResponse_7<T>(
          this,
          Invocation.method(
            #get,
            [path],
            {
              #data: data,
              #queryParameters: queryParameters,
              #options: options,
              #cancelToken: cancelToken,
              #onReceiveProgress: onReceiveProgress,
            },
          ),
        )),
      ) as _i11.Future<_i9.Response<T>>);

  @override
  _i11.Future<_i9.Response<T>> getUri<T>(
    Uri? uri, {
    Object? data,
    _i5.Options? options,
    _i24.CancelToken? cancelToken,
    _i5.ProgressCallback? onReceiveProgress,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #getUri,
          [uri],
          {
            #data: data,
            #options: options,
            #cancelToken: cancelToken,
            #onReceiveProgress: onReceiveProgress,
          },
        ),
        returnValue: _i11.Future<_i9.Response<T>>.value(_FakeResponse_7<T>(
          this,
          Invocation.method(
            #getUri,
            [uri],
            {
              #data: data,
              #options: options,
              #cancelToken: cancelToken,
              #onReceiveProgress: onReceiveProgress,
            },
          ),
        )),
      ) as _i11.Future<_i9.Response<T>>);

  @override
  _i11.Future<_i9.Response<T>> post<T>(
    String? path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    _i5.Options? options,
    _i24.CancelToken? cancelToken,
    _i5.ProgressCallback? onSendProgress,
    _i5.ProgressCallback? onReceiveProgress,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #post,
          [path],
          {
            #data: data,
            #queryParameters: queryParameters,
            #options: options,
            #cancelToken: cancelToken,
            #onSendProgress: onSendProgress,
            #onReceiveProgress: onReceiveProgress,
          },
        ),
        returnValue: _i11.Future<_i9.Response<T>>.value(_FakeResponse_7<T>(
          this,
          Invocation.method(
            #post,
            [path],
            {
              #data: data,
              #queryParameters: queryParameters,
              #options: options,
              #cancelToken: cancelToken,
              #onSendProgress: onSendProgress,
              #onReceiveProgress: onReceiveProgress,
            },
          ),
        )),
      ) as _i11.Future<_i9.Response<T>>);

  @override
  _i11.Future<_i9.Response<T>> postUri<T>(
    Uri? uri, {
    Object? data,
    _i5.Options? options,
    _i24.CancelToken? cancelToken,
    _i5.ProgressCallback? onSendProgress,
    _i5.ProgressCallback? onReceiveProgress,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #postUri,
          [uri],
          {
            #data: data,
            #options: options,
            #cancelToken: cancelToken,
            #onSendProgress: onSendProgress,
            #onReceiveProgress: onReceiveProgress,
          },
        ),
        returnValue: _i11.Future<_i9.Response<T>>.value(_FakeResponse_7<T>(
          this,
          Invocation.method(
            #postUri,
            [uri],
            {
              #data: data,
              #options: options,
              #cancelToken: cancelToken,
              #onSendProgress: onSendProgress,
              #onReceiveProgress: onReceiveProgress,
            },
          ),
        )),
      ) as _i11.Future<_i9.Response<T>>);

  @override
  _i11.Future<_i9.Response<T>> put<T>(
    String? path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    _i5.Options? options,
    _i24.CancelToken? cancelToken,
    _i5.ProgressCallback? onSendProgress,
    _i5.ProgressCallback? onReceiveProgress,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #put,
          [path],
          {
            #data: data,
            #queryParameters: queryParameters,
            #options: options,
            #cancelToken: cancelToken,
            #onSendProgress: onSendProgress,
            #onReceiveProgress: onReceiveProgress,
          },
        ),
        returnValue: _i11.Future<_i9.Response<T>>.value(_FakeResponse_7<T>(
          this,
          Invocation.method(
            #put,
            [path],
            {
              #data: data,
              #queryParameters: queryParameters,
              #options: options,
              #cancelToken: cancelToken,
              #onSendProgress: onSendProgress,
              #onReceiveProgress: onReceiveProgress,
            },
          ),
        )),
      ) as _i11.Future<_i9.Response<T>>);

  @override
  _i11.Future<_i9.Response<T>> putUri<T>(
    Uri? uri, {
    Object? data,
    _i5.Options? options,
    _i24.CancelToken? cancelToken,
    _i5.ProgressCallback? onSendProgress,
    _i5.ProgressCallback? onReceiveProgress,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #putUri,
          [uri],
          {
            #data: data,
            #options: options,
            #cancelToken: cancelToken,
            #onSendProgress: onSendProgress,
            #onReceiveProgress: onReceiveProgress,
          },
        ),
        returnValue: _i11.Future<_i9.Response<T>>.value(_FakeResponse_7<T>(
          this,
          Invocation.method(
            #putUri,
            [uri],
            {
              #data: data,
              #options: options,
              #cancelToken: cancelToken,
              #onSendProgress: onSendProgress,
              #onReceiveProgress: onReceiveProgress,
            },
          ),
        )),
      ) as _i11.Future<_i9.Response<T>>);

  @override
  _i11.Future<_i9.Response<T>> patch<T>(
    String? path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    _i5.Options? options,
    _i24.CancelToken? cancelToken,
    _i5.ProgressCallback? onSendProgress,
    _i5.ProgressCallback? onReceiveProgress,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #patch,
          [path],
          {
            #data: data,
            #queryParameters: queryParameters,
            #options: options,
            #cancelToken: cancelToken,
            #onSendProgress: onSendProgress,
            #onReceiveProgress: onReceiveProgress,
          },
        ),
        returnValue: _i11.Future<_i9.Response<T>>.value(_FakeResponse_7<T>(
          this,
          Invocation.method(
            #patch,
            [path],
            {
              #data: data,
              #queryParameters: queryParameters,
              #options: options,
              #cancelToken: cancelToken,
              #onSendProgress: onSendProgress,
              #onReceiveProgress: onReceiveProgress,
            },
          ),
        )),
      ) as _i11.Future<_i9.Response<T>>);

  @override
  _i11.Future<_i9.Response<T>> patchUri<T>(
    Uri? uri, {
    Object? data,
    _i5.Options? options,
    _i24.CancelToken? cancelToken,
    _i5.ProgressCallback? onSendProgress,
    _i5.ProgressCallback? onReceiveProgress,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #patchUri,
          [uri],
          {
            #data: data,
            #options: options,
            #cancelToken: cancelToken,
            #onSendProgress: onSendProgress,
            #onReceiveProgress: onReceiveProgress,
          },
        ),
        returnValue: _i11.Future<_i9.Response<T>>.value(_FakeResponse_7<T>(
          this,
          Invocation.method(
            #patchUri,
            [uri],
            {
              #data: data,
              #options: options,
              #cancelToken: cancelToken,
              #onSendProgress: onSendProgress,
              #onReceiveProgress: onReceiveProgress,
            },
          ),
        )),
      ) as _i11.Future<_i9.Response<T>>);

  @override
  _i11.Future<_i9.Response<T>> delete<T>(
    String? path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    _i5.Options? options,
    _i24.CancelToken? cancelToken,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #delete,
          [path],
          {
            #data: data,
            #queryParameters: queryParameters,
            #options: options,
            #cancelToken: cancelToken,
          },
        ),
        returnValue: _i11.Future<_i9.Response<T>>.value(_FakeResponse_7<T>(
          this,
          Invocation.method(
            #delete,
            [path],
            {
              #data: data,
              #queryParameters: queryParameters,
              #options: options,
              #cancelToken: cancelToken,
            },
          ),
        )),
      ) as _i11.Future<_i9.Response<T>>);

  @override
  _i11.Future<_i9.Response<T>> deleteUri<T>(
    Uri? uri, {
    Object? data,
    _i5.Options? options,
    _i24.CancelToken? cancelToken,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #deleteUri,
          [uri],
          {
            #data: data,
            #options: options,
            #cancelToken: cancelToken,
          },
        ),
        returnValue: _i11.Future<_i9.Response<T>>.value(_FakeResponse_7<T>(
          this,
          Invocation.method(
            #deleteUri,
            [uri],
            {
              #data: data,
              #options: options,
              #cancelToken: cancelToken,
            },
          ),
        )),
      ) as _i11.Future<_i9.Response<T>>);

  @override
  _i11.Future<_i9.Response<dynamic>> download(
    String? urlPath,
    dynamic savePath, {
    _i5.ProgressCallback? onReceiveProgress,
    Map<String, dynamic>? queryParameters,
    _i24.CancelToken? cancelToken,
    bool? deleteOnError = true,
    String? lengthHeader = r'content-length',
    Object? data,
    _i5.Options? options,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #download,
          [
            urlPath,
            savePath,
          ],
          {
            #onReceiveProgress: onReceiveProgress,
            #queryParameters: queryParameters,
            #cancelToken: cancelToken,
            #deleteOnError: deleteOnError,
            #lengthHeader: lengthHeader,
            #data: data,
            #options: options,
          },
        ),
        returnValue:
            _i11.Future<_i9.Response<dynamic>>.value(_FakeResponse_7<dynamic>(
          this,
          Invocation.method(
            #download,
            [
              urlPath,
              savePath,
            ],
            {
              #onReceiveProgress: onReceiveProgress,
              #queryParameters: queryParameters,
              #cancelToken: cancelToken,
              #deleteOnError: deleteOnError,
              #lengthHeader: lengthHeader,
              #data: data,
              #options: options,
            },
          ),
        )),
      ) as _i11.Future<_i9.Response<dynamic>>);

  @override
  _i11.Future<_i9.Response<dynamic>> downloadUri(
    Uri? uri,
    dynamic savePath, {
    _i5.ProgressCallback? onReceiveProgress,
    _i24.CancelToken? cancelToken,
    bool? deleteOnError = true,
    String? lengthHeader = r'content-length',
    Object? data,
    _i5.Options? options,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #downloadUri,
          [
            uri,
            savePath,
          ],
          {
            #onReceiveProgress: onReceiveProgress,
            #cancelToken: cancelToken,
            #deleteOnError: deleteOnError,
            #lengthHeader: lengthHeader,
            #data: data,
            #options: options,
          },
        ),
        returnValue:
            _i11.Future<_i9.Response<dynamic>>.value(_FakeResponse_7<dynamic>(
          this,
          Invocation.method(
            #downloadUri,
            [
              uri,
              savePath,
            ],
            {
              #onReceiveProgress: onReceiveProgress,
              #cancelToken: cancelToken,
              #deleteOnError: deleteOnError,
              #lengthHeader: lengthHeader,
              #data: data,
              #options: options,
            },
          ),
        )),
      ) as _i11.Future<_i9.Response<dynamic>>);

  @override
  _i11.Future<_i9.Response<T>> request<T>(
    String? url, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    _i24.CancelToken? cancelToken,
    _i5.Options? options,
    _i5.ProgressCallback? onSendProgress,
    _i5.ProgressCallback? onReceiveProgress,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #request,
          [url],
          {
            #data: data,
            #queryParameters: queryParameters,
            #cancelToken: cancelToken,
            #options: options,
            #onSendProgress: onSendProgress,
            #onReceiveProgress: onReceiveProgress,
          },
        ),
        returnValue: _i11.Future<_i9.Response<T>>.value(_FakeResponse_7<T>(
          this,
          Invocation.method(
            #request,
            [url],
            {
              #data: data,
              #queryParameters: queryParameters,
              #cancelToken: cancelToken,
              #options: options,
              #onSendProgress: onSendProgress,
              #onReceiveProgress: onReceiveProgress,
            },
          ),
        )),
      ) as _i11.Future<_i9.Response<T>>);

  @override
  _i11.Future<_i9.Response<T>> requestUri<T>(
    Uri? uri, {
    Object? data,
    _i24.CancelToken? cancelToken,
    _i5.Options? options,
    _i5.ProgressCallback? onSendProgress,
    _i5.ProgressCallback? onReceiveProgress,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #requestUri,
          [uri],
          {
            #data: data,
            #cancelToken: cancelToken,
            #options: options,
            #onSendProgress: onSendProgress,
            #onReceiveProgress: onReceiveProgress,
          },
        ),
        returnValue: _i11.Future<_i9.Response<T>>.value(_FakeResponse_7<T>(
          this,
          Invocation.method(
            #requestUri,
            [uri],
            {
              #data: data,
              #cancelToken: cancelToken,
              #options: options,
              #onSendProgress: onSendProgress,
              #onReceiveProgress: onReceiveProgress,
            },
          ),
        )),
      ) as _i11.Future<_i9.Response<T>>);

  @override
  _i11.Future<_i9.Response<T>> fetch<T>(_i5.RequestOptions? requestOptions) =>
      (super.noSuchMethod(
        Invocation.method(
          #fetch,
          [requestOptions],
        ),
        returnValue: _i11.Future<_i9.Response<T>>.value(_FakeResponse_7<T>(
          this,
          Invocation.method(
            #fetch,
            [requestOptions],
          ),
        )),
      ) as _i11.Future<_i9.Response<T>>);
}
