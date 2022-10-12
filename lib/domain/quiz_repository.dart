import 'dart:developer';

import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inno_quiz_app/data/model/question_model.dart';
import 'package:inno_quiz_app/data/model/quiz_model.dart';
import 'package:inno_quiz_app/data/model/result_model.dart';
import 'package:inno_quiz_app/domain/entity/quiz_entity.dart';
import 'package:inno_quiz_app/presentation/locator.dart';

class QuizRepository {
  final Ref _ref;
  final _firestore = FirebaseFirestore.instance;

  QuizRepository(this._ref);

  Future<QuizEntity> getQuiz(String quizName) async {
    final quiz = await _firestore
        .collection('quizzes')
        .where(FieldPath(['name']), isEqualTo: quizName)
        .get();

    final quizModel = QuizModel.fromJson(quiz.docs.first.data());

    if (quizModel == null) {
      throw Exception('Quiz not found');
    }
    final quizModelWithQuestionIds = quizModel.rebuild(
      (b) => b
        ..questions = ListBuilder(quizModel.questions.rebuild((p0) =>
            p0.replace(List.generate(9, (index) => (index + 1).toString())))),
    );

    final questions = await Future.wait(
      quizModelWithQuestionIds.questions.map((p0) => getQuestion(p0)),
      eagerError: true,
    );

    final quizEntity = QuizEntity((b) => b
      ..name = quizModel.name
      ..questions = ListBuilder(questions));
    return quizEntity;
  }

  Future<QuestionModel> getQuestion(String questionId) async {
    // log('getting question $questionId');
    final question = await _firestore
        .collection('questions')
        .where('id', isEqualTo: questionId)
        .get();
    // log(question.data().toString());
    if (question.docs.isEmpty) {
      throw Exception('Question $questionId not found');
    }
    final questionModel = QuestionModel.fromJson(question.docs.first.data());
    if (questionModel == null) {
      throw Exception('Question $questionId not found');
    }
    log(questionModel.toString());
    return questionModel;
  }

  Future<QuizEntity> initializeQuiz(final String quizName) async {
    final quiz = await getQuiz(quizName);
    final username = _ref.read(resultProvider).username;
    _ref.read(quizProvider.notifier).rebuildState((p0) => p0.replace(quiz));
    _ref.read(resultProvider.notifier).rebuildState((p0) {
      p0.replace(ResultModel.empty());
      p0.quizId = quiz.name;
      p0.username = username;
    });
    return quiz;
  }

  Future<void> saveResult() async {
    final result = _ref.read(resultProvider);
    await _firestore.collection('results').add(result.toJson());
  }

  Future<void> updateResult(
      final String quistionId, final String answer) async {
    _ref.read(resultProvider.notifier).rebuildState((p0) {
      p0.answers[quistionId] = answer;
    });
  }
}
