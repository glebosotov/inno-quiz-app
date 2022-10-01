import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:inno_quiz_app/data/model/question_model.dart';

part 'quiz_entity.g.dart';

abstract class QuizEntity implements Built<QuizEntity, QuizEntityBuilder> {
  String get name;
  BuiltList<QuestionModel> get questions;

  QuizEntity._();
  factory QuizEntity([void Function(QuizEntityBuilder) updates]) = _$QuizEntity;
}
