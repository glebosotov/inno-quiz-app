library serializers;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:inno_quiz_app/data/model/question_model.dart';
import 'package:inno_quiz_app/data/model/quiz_model.dart';
import 'package:inno_quiz_app/data/model/result_model.dart';

part 'serializers.g.dart';

@SerializersFor([
  QuestionModel,
  QuizModel,
  ResultModel,
])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
