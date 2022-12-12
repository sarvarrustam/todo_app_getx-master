// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TaskBaseModel _$$_TaskBaseModelFromJson(Map<String, dynamic> json) =>
    _$_TaskBaseModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      userId: json['userId'] as String?,
      publishDate: json['publishDate'] == null
          ? null
          : DateTime.parse(json['publishDate'] as String),
    );

Map<String, dynamic> _$$_TaskBaseModelToJson(_$_TaskBaseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'userId': instance.userId,
      'publishDate': instance.publishDate?.toIso8601String(),
    };
