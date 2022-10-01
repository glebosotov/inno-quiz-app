import 'dart:developer';

import 'package:built_collection/built_collection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inno_quiz_app/domain/entity/quiz_entity.dart';

class QuizProvider extends StateNotifier<QuizEntity> {
  QuizProvider()
      : super(QuizEntity(
          (q) => q
            ..name = ''
            ..questions = ListBuilder([]),
        ));

  void updateState(QuizEntity newState) => state = newState;

  QuizEntity rebuildState(Function(QuizEntityBuilder) updates) {
    final newState = state.rebuild(updates);
    updateState(newState);
    log(state.toString());
    return state;
  }
}
