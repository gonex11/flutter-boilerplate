// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../meta_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MetaResponse _$MetaResponseFromJson(Map<String, dynamic> json) {
  return _MetaResponse.fromJson(json);
}

/// @nodoc
mixin _$MetaResponse {
  int get page => throw _privateConstructorUsedError;
  int get totalData => throw _privateConstructorUsedError;
  int get totalPage => throw _privateConstructorUsedError;

  /// Serializes this MetaResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MetaResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MetaResponseCopyWith<MetaResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MetaResponseCopyWith<$Res> {
  factory $MetaResponseCopyWith(
          MetaResponse value, $Res Function(MetaResponse) then) =
      _$MetaResponseCopyWithImpl<$Res, MetaResponse>;
  @useResult
  $Res call({int page, int totalData, int totalPage});
}

/// @nodoc
class _$MetaResponseCopyWithImpl<$Res, $Val extends MetaResponse>
    implements $MetaResponseCopyWith<$Res> {
  _$MetaResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MetaResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? totalData = null,
    Object? totalPage = null,
  }) {
    return _then(_value.copyWith(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      totalData: null == totalData
          ? _value.totalData
          : totalData // ignore: cast_nullable_to_non_nullable
              as int,
      totalPage: null == totalPage
          ? _value.totalPage
          : totalPage // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MetaResponseImplCopyWith<$Res>
    implements $MetaResponseCopyWith<$Res> {
  factory _$$MetaResponseImplCopyWith(
          _$MetaResponseImpl value, $Res Function(_$MetaResponseImpl) then) =
      __$$MetaResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int page, int totalData, int totalPage});
}

/// @nodoc
class __$$MetaResponseImplCopyWithImpl<$Res>
    extends _$MetaResponseCopyWithImpl<$Res, _$MetaResponseImpl>
    implements _$$MetaResponseImplCopyWith<$Res> {
  __$$MetaResponseImplCopyWithImpl(
      _$MetaResponseImpl _value, $Res Function(_$MetaResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of MetaResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? totalData = null,
    Object? totalPage = null,
  }) {
    return _then(_$MetaResponseImpl(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      totalData: null == totalData
          ? _value.totalData
          : totalData // ignore: cast_nullable_to_non_nullable
              as int,
      totalPage: null == totalPage
          ? _value.totalPage
          : totalPage // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MetaResponseImpl implements _MetaResponse {
  const _$MetaResponseImpl(
      {required this.page, required this.totalData, required this.totalPage});

  factory _$MetaResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$MetaResponseImplFromJson(json);

  @override
  final int page;
  @override
  final int totalData;
  @override
  final int totalPage;

  @override
  String toString() {
    return 'MetaResponse(page: $page, totalData: $totalData, totalPage: $totalPage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MetaResponseImpl &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.totalData, totalData) ||
                other.totalData == totalData) &&
            (identical(other.totalPage, totalPage) ||
                other.totalPage == totalPage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, page, totalData, totalPage);

  /// Create a copy of MetaResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MetaResponseImplCopyWith<_$MetaResponseImpl> get copyWith =>
      __$$MetaResponseImplCopyWithImpl<_$MetaResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MetaResponseImplToJson(
      this,
    );
  }
}

abstract class _MetaResponse implements MetaResponse {
  const factory _MetaResponse(
      {required final int page,
      required final int totalData,
      required final int totalPage}) = _$MetaResponseImpl;

  factory _MetaResponse.fromJson(Map<String, dynamic> json) =
      _$MetaResponseImpl.fromJson;

  @override
  int get page;
  @override
  int get totalData;
  @override
  int get totalPage;

  /// Create a copy of MetaResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MetaResponseImplCopyWith<_$MetaResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
