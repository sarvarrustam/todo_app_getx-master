// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Task _$$_TaskFromJson(Map<String, dynamic> json) => _$_Task(
      id: json['id'] as String?,
      userId: json['userId'] as String?,
      task: json['task'] as String?,
      note: json['note'] as String?,
      isCompleted: json['isCompleted'] as bool?,
      isFavourite: json['isFavourite'] as bool?,
      publishedDate: json['publishedDate'] == null
          ? null
          : DateTime.parse(json['publishedDate'] as String),
      taskListId: json['taskListId'] as String?,
      taskListName: json['taskListName'] as String?,
    );

Map<String, dynamic> _$$_TaskToJson(_$_Task instance) => <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'task': instance.task,
      'note': instance.note,
      'isCompleted': instance.isCompleted,
      'isFavourite': instance.isFavourite,
      'publishedDate': instance.publishedDate?.toIso8601String(),
      'taskListId': instance.taskListId,
      'taskListName': instance.taskListName,
    };
