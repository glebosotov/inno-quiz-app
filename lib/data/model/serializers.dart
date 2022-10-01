library serializers;

import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:inno_quiz_app/data/model/queation_model.dart';

part 'serializers.g.dart';

@SerializersFor([QuestionModel])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
