import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inno_quiz_app/data/model/result_model.dart';

class ResultProvider extends StateNotifier<ResultModel> {
  ResultProvider() : super(ResultModel.empty());

  void updateState(ResultModel newState) => state = newState;

  ResultModel rebuildState(Function(ResultModelBuilder) updates) {
    final newState = state.rebuild(updates);
    updateState(newState);
    log(state.toString());
    return state;
  }
}
