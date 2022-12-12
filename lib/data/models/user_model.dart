import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_app_getx/data/models/base_model.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class User with _$User implements BaseModel {
  const factory User({
    String? uid,
    String? username,
    String? password,
    String? email,
    String? photoAvatarUrl,
    DateTime? userCreatedDate,
    List<Map<String, dynamic>>? taskLists,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  factory User.fromDocumentSnapshot(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final Map<String, dynamic> data = snapshot.data()!;
    return User.fromJson(data);
  }
}
