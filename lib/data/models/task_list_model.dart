import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_app_getx/data/models/base_model.dart';

part 'task_list_model.freezed.dart';
part 'task_list_model.g.dart';

@freezed
class TaskBaseModel with _$TaskBaseModel implements BaseModel {
  const factory TaskBaseModel(
      {String? id,
      String? name,
      String? userId,
      DateTime? publishDate}) = _TaskBaseModel;

  factory TaskBaseModel.fromJson(Map<String, dynamic> json) =>
      _$TaskBaseModelFromJson(json);
}
