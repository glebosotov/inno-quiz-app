import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:inno_quiz_app/data/model/serializers.dart';

part 'quiz_model.g.dart';

abstract class QuizModel implements Built<QuizModel, QuizModelBuilder> {
  String get name;
  BuiltList<String> get questions;

  QuizModel._();
  factory QuizModel([void Function(QuizModelBuilder) updates]) = _$QuizModel;

  static QuizModel? fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(QuizModel.serializer, json);
  }

  static Serializer<QuizModel> get serializer => _$quizModelSerializer;
}
