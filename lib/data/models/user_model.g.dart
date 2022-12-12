// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      uid: json['uid'] as String?,
      username: json['username'] as String?,
      password: json['password'] as String?,
      email: json['email'] as String?,
      photoAvatarUrl: json['photoAvatarUrl'] as String?,
      userCreatedDate: json['userCreatedDate'] == null
          ? null
          : DateTime.parse(json['userCreatedDate'] as String),
      taskLists: (json['taskLists'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'uid': instance.uid,
      'username': instance.username,
      'password': instance.password,
      'email': instance.email,
      'photoAvatarUrl': instance.photoAvatarUrl,
      'userCreatedDate': instance.userCreatedDate?.toIso8601String(),
      'taskLists': instance.taskLists,
    };
