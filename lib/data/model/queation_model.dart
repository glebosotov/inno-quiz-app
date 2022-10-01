import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:inno_quiz_app/data/model/serializers.dart';

part 'queation_model.g.dart';

abstract class QuestionModel
    implements Built<QuestionModel, QuestionModelBuilder> {
  String get text;

  QuestionModel._();
  factory QuestionModel([void Function(QuestionModelBuilder) updates]) =
      _$QuestionModel;

  static QuestionModel? fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(QuestionModel.serializer, json);
  }

  static Serializer<QuestionModel> get serializer => _$questionModelSerializer;
}
