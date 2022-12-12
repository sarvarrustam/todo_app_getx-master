// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'task_list_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TaskBaseModel _$TaskBaseModelFromJson(Map<String, dynamic> json) {
  return _TaskBaseModel.fromJson(json);
}

/// @nodoc
mixin _$TaskBaseModel {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get userId => throw _privateConstructorUsedError;
  DateTime? get publishDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TaskBaseModelCopyWith<TaskBaseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskBaseModelCopyWith<$Res> {
  factory $TaskBaseModelCopyWith(
          TaskBaseModel value, $Res Function(TaskBaseModel) then) =
      _$TaskBaseModelCopyWithImpl<$Res, TaskBaseModel>;
  @useResult
  $Res call({String? id, String? name, String? userId, DateTime? publishDate});
}

/// @nodoc
class _$TaskBaseModelCopyWithImpl<$Res, $Val extends TaskBaseModel>
    implements $TaskBaseModelCopyWith<$Res> {
  _$TaskBaseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? userId = freezed,
    Object? publishDate = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      publishDate: freezed == publishDate
          ? _value.publishDate
          : publishDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TaskBaseModelCopyWith<$Res>
    implements $TaskBaseModelCopyWith<$Res> {
  factory _$$_TaskBaseModelCopyWith(
          _$_TaskBaseModel value, $Res Function(_$_TaskBaseModel) then) =
      __$$_TaskBaseModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id, String? name, String? userId, DateTime? publishDate});
}

/// @nodoc
class __$$_TaskBaseModelCopyWithImpl<$Res>
    extends _$TaskBaseModelCopyWithImpl<$Res, _$_TaskBaseModel>
    implements _$$_TaskBaseModelCopyWith<$Res> {
  __$$_TaskBaseModelCopyWithImpl(
      _$_TaskBaseModel _value, $Res Function(_$_TaskBaseModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? userId = freezed,
    Object? publishDate = freezed,
  }) {
    return _then(_$_TaskBaseModel(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      publishDate: freezed == publishDate
          ? _value.publishDate
          : publishDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TaskBaseModel implements _TaskBaseModel {
  const _$_TaskBaseModel({this.id, this.name, this.userId, this.publishDate});

  factory _$_TaskBaseModel.fromJson(Map<String, dynamic> json) =>
      _$$_TaskBaseModelFromJson(json);

  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? userId;
  @override
  final DateTime? publishDate;

  @override
  String toString() {
    return 'TaskBaseModel(id: $id, name: $name, userId: $userId, publishDate: $publishDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TaskBaseModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.publishDate, publishDate) ||
                other.publishDate == publishDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, userId, publishDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TaskBaseModelCopyWith<_$_TaskBaseModel> get copyWith =>
      __$$_TaskBaseModelCopyWithImpl<_$_TaskBaseModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TaskBaseModelToJson(
      this,
    );
  }
}

abstract class _TaskBaseModel implements TaskBaseModel {
  const factory _TaskBaseModel(
      {final String? id,
      final String? name,
      final String? userId,
      final DateTime? publishDate}) = _$_TaskBaseModel;

  factory _TaskBaseModel.fromJson(Map<String, dynamic> json) =
      _$_TaskBaseModel.fromJson;

  @override
  String? get id;
  @override
  String? get name;
  @override
  String? get userId;
  @override
  DateTime? get publishDate;
  @override
  @JsonKey(ignore: true)
  _$$_TaskBaseModelCopyWith<_$_TaskBaseModel> get copyWith =>
      throw _privateConstructorUsedError;
}
