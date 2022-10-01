import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inno_quiz_app/data/model/result_model.dart';
import 'package:inno_quiz_app/domain/entity/quiz_entity.dart';
import 'package:inno_quiz_app/domain/quiz_provider.dart';
import 'package:inno_quiz_app/domain/quiz_repository.dart';
import 'package:inno_quiz_app/domain/result_provider.dart';

late StateNotifierProvider<QuizProvider, QuizEntity> quizProvider;
late StateNotifierProvider<ResultProvider, ResultModel> resultProvider;
late Provider<QuizRepository> quizRepository;

void initLocator() {
  quizProvider = StateNotifierProvider((ref) => QuizProvider());
  resultProvider = StateNotifierProvider((ref) => ResultProvider());
  quizRepository = Provider((ref) => QuizRepository(ref));
}
