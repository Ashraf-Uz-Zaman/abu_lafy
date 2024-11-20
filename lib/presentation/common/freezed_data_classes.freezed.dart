// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'freezed_data_classes.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LoginObject {
  String get phone => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get fcmToken => throw _privateConstructorUsedError;

  /// Create a copy of LoginObject
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LoginObjectCopyWith<LoginObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginObjectCopyWith<$Res> {
  factory $LoginObjectCopyWith(
          LoginObject value, $Res Function(LoginObject) then) =
      _$LoginObjectCopyWithImpl<$Res, LoginObject>;
  @useResult
  $Res call({String phone, String password, String fcmToken});
}

/// @nodoc
class _$LoginObjectCopyWithImpl<$Res, $Val extends LoginObject>
    implements $LoginObjectCopyWith<$Res> {
  _$LoginObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoginObject
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phone = null,
    Object? password = null,
    Object? fcmToken = null,
  }) {
    return _then(_value.copyWith(
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      fcmToken: null == fcmToken
          ? _value.fcmToken
          : fcmToken // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoginObjectImplCopyWith<$Res>
    implements $LoginObjectCopyWith<$Res> {
  factory _$$LoginObjectImplCopyWith(
          _$LoginObjectImpl value, $Res Function(_$LoginObjectImpl) then) =
      __$$LoginObjectImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String phone, String password, String fcmToken});
}

/// @nodoc
class __$$LoginObjectImplCopyWithImpl<$Res>
    extends _$LoginObjectCopyWithImpl<$Res, _$LoginObjectImpl>
    implements _$$LoginObjectImplCopyWith<$Res> {
  __$$LoginObjectImplCopyWithImpl(
      _$LoginObjectImpl _value, $Res Function(_$LoginObjectImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoginObject
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phone = null,
    Object? password = null,
    Object? fcmToken = null,
  }) {
    return _then(_$LoginObjectImpl(
      null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      null == fcmToken
          ? _value.fcmToken
          : fcmToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LoginObjectImpl implements _LoginObject {
  _$LoginObjectImpl(this.phone, this.password, this.fcmToken);

  @override
  final String phone;
  @override
  final String password;
  @override
  final String fcmToken;

  @override
  String toString() {
    return 'LoginObject(phone: $phone, password: $password, fcmToken: $fcmToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginObjectImpl &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.fcmToken, fcmToken) ||
                other.fcmToken == fcmToken));
  }

  @override
  int get hashCode => Object.hash(runtimeType, phone, password, fcmToken);

  /// Create a copy of LoginObject
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginObjectImplCopyWith<_$LoginObjectImpl> get copyWith =>
      __$$LoginObjectImplCopyWithImpl<_$LoginObjectImpl>(this, _$identity);
}

abstract class _LoginObject implements LoginObject {
  factory _LoginObject(
          final String phone, final String password, final String fcmToken) =
      _$LoginObjectImpl;

  @override
  String get phone;
  @override
  String get password;
  @override
  String get fcmToken;

  /// Create a copy of LoginObject
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoginObjectImplCopyWith<_$LoginObjectImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$RegistrationObject {
  String get name => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;

  /// Create a copy of RegistrationObject
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RegistrationObjectCopyWith<RegistrationObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegistrationObjectCopyWith<$Res> {
  factory $RegistrationObjectCopyWith(
          RegistrationObject value, $Res Function(RegistrationObject) then) =
      _$RegistrationObjectCopyWithImpl<$Res, RegistrationObject>;
  @useResult
  $Res call({String name, String password, String phone});
}

/// @nodoc
class _$RegistrationObjectCopyWithImpl<$Res, $Val extends RegistrationObject>
    implements $RegistrationObjectCopyWith<$Res> {
  _$RegistrationObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RegistrationObject
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? password = null,
    Object? phone = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RegistrationObjectImplCopyWith<$Res>
    implements $RegistrationObjectCopyWith<$Res> {
  factory _$$RegistrationObjectImplCopyWith(_$RegistrationObjectImpl value,
          $Res Function(_$RegistrationObjectImpl) then) =
      __$$RegistrationObjectImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String password, String phone});
}

/// @nodoc
class __$$RegistrationObjectImplCopyWithImpl<$Res>
    extends _$RegistrationObjectCopyWithImpl<$Res, _$RegistrationObjectImpl>
    implements _$$RegistrationObjectImplCopyWith<$Res> {
  __$$RegistrationObjectImplCopyWithImpl(_$RegistrationObjectImpl _value,
      $Res Function(_$RegistrationObjectImpl) _then)
      : super(_value, _then);

  /// Create a copy of RegistrationObject
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? password = null,
    Object? phone = null,
  }) {
    return _then(_$RegistrationObjectImpl(
      null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RegistrationObjectImpl implements _RegistrationObject {
  _$RegistrationObjectImpl(this.name, this.password, this.phone);

  @override
  final String name;
  @override
  final String password;
  @override
  final String phone;

  @override
  String toString() {
    return 'RegistrationObject(name: $name, password: $password, phone: $phone)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegistrationObjectImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.phone, phone) || other.phone == phone));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, password, phone);

  /// Create a copy of RegistrationObject
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RegistrationObjectImplCopyWith<_$RegistrationObjectImpl> get copyWith =>
      __$$RegistrationObjectImplCopyWithImpl<_$RegistrationObjectImpl>(
          this, _$identity);
}

abstract class _RegistrationObject implements RegistrationObject {
  factory _RegistrationObject(
          final String name, final String password, final String phone) =
      _$RegistrationObjectImpl;

  @override
  String get name;
  @override
  String get password;
  @override
  String get phone;

  /// Create a copy of RegistrationObject
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RegistrationObjectImplCopyWith<_$RegistrationObjectImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ForgetObject {
  String get phone => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  /// Create a copy of ForgetObject
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ForgetObjectCopyWith<ForgetObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForgetObjectCopyWith<$Res> {
  factory $ForgetObjectCopyWith(
          ForgetObject value, $Res Function(ForgetObject) then) =
      _$ForgetObjectCopyWithImpl<$Res, ForgetObject>;
  @useResult
  $Res call({String phone, String password});
}

/// @nodoc
class _$ForgetObjectCopyWithImpl<$Res, $Val extends ForgetObject>
    implements $ForgetObjectCopyWith<$Res> {
  _$ForgetObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ForgetObject
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phone = null,
    Object? password = null,
  }) {
    return _then(_value.copyWith(
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ForgetObjectImplCopyWith<$Res>
    implements $ForgetObjectCopyWith<$Res> {
  factory _$$ForgetObjectImplCopyWith(
          _$ForgetObjectImpl value, $Res Function(_$ForgetObjectImpl) then) =
      __$$ForgetObjectImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String phone, String password});
}

/// @nodoc
class __$$ForgetObjectImplCopyWithImpl<$Res>
    extends _$ForgetObjectCopyWithImpl<$Res, _$ForgetObjectImpl>
    implements _$$ForgetObjectImplCopyWith<$Res> {
  __$$ForgetObjectImplCopyWithImpl(
      _$ForgetObjectImpl _value, $Res Function(_$ForgetObjectImpl) _then)
      : super(_value, _then);

  /// Create a copy of ForgetObject
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phone = null,
    Object? password = null,
  }) {
    return _then(_$ForgetObjectImpl(
      null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ForgetObjectImpl implements _ForgetObject {
  _$ForgetObjectImpl(this.phone, this.password);

  @override
  final String phone;
  @override
  final String password;

  @override
  String toString() {
    return 'ForgetObject(phone: $phone, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForgetObjectImpl &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, phone, password);

  /// Create a copy of ForgetObject
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ForgetObjectImplCopyWith<_$ForgetObjectImpl> get copyWith =>
      __$$ForgetObjectImplCopyWithImpl<_$ForgetObjectImpl>(this, _$identity);
}

abstract class _ForgetObject implements ForgetObject {
  factory _ForgetObject(final String phone, final String password) =
      _$ForgetObjectImpl;

  @override
  String get phone;
  @override
  String get password;

  /// Create a copy of ForgetObject
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ForgetObjectImplCopyWith<_$ForgetObjectImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
