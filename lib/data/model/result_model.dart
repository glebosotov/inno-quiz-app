import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:inno_quiz_app/data/model/serializers.dart';

part 'result_model.g.dart';

abstract class ResultModel implements Built<ResultModel, ResultModelBuilder> {
  String get username;
  String get quizId;
  BuiltMap<String, String> get answers;

  ResultModel._();
  factory ResultModel([void Function(ResultModelBuilder) updates]) =
      _$ResultModel;

  factory ResultModel.empty() {
    return ResultModel((r) => r
      ..username = ''
      ..quizId = ''
      ..answers = MapBuilder({}));
  }

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(ResultModel.serializer, this)
        as Map<String, dynamic>;
  }

  static ResultModel? fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(ResultModel.serializer, json);
  }

  static Serializer<ResultModel> get serializer => _$resultModelSerializer;
}
