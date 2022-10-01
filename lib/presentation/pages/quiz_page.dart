import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inno_quiz_app/presentation/locator.dart';
import 'package:inno_quiz_app/presentation/pages/quiz_layout.dart';

class QuizPage extends ConsumerStatefulWidget {
  final String quizName;
  const QuizPage({
    this.quizName = 'Quiz 1',
    super.key,
  });

  @override
  ConsumerState<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends ConsumerState<QuizPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder<void>(
          future: ref.read(quizRepository).initializeQuiz(widget.quizName),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Center(
                child: QuizLayout(
                  quiz: ref.read(quizProvider),
                ),
              );
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else {
              return Center(child: CircularProgressIndicator.adaptive());
            }
          },
        ),
      ),
    );
  }
}
