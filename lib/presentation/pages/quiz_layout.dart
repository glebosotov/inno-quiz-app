import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inno_quiz_app/domain/entity/quiz_entity.dart';
import 'package:inno_quiz_app/presentation/locator.dart';
import 'package:inno_quiz_app/presentation/pages/navigation/router.dart';

class QuizLayout extends ConsumerStatefulWidget {
  final QuizEntity quiz;
  const QuizLayout({
    super.key,
    required this.quiz,
  });

  @override
  ConsumerState<QuizLayout> createState() => _QuizLayoutState();
}

class _QuizLayoutState extends ConsumerState<QuizLayout> {
  final _pageController = PageController();
  int quiestionIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(10),
      ),
      constraints: BoxConstraints(
        maxWidth: 400,
        maxHeight: 400,
      ),
      child: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: widget.quiz.questions.length,
              itemBuilder: (context, index) {
                return Container(
                  // margin: const EdgeInsets.all(20),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondaryContainer,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Text(
                        widget.quiz.questions[index].text,
                        style: Theme.of(context).textTheme.displaySmall,
                        maxLines: 5,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [-2, -1, 0, 1, 2]
                .map(
                  (e) => ElevatedButton(
                    onPressed: () {
                      ref.read(quizRepository).updateResult(
                          widget
                              .quiz.questions[_pageController.page!.ceil()].id,
                          e.toString());
                      if (widget.quiz.questions.length - 1 >
                          _pageController.page!) {
                        _pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeIn);
                      } else {
                        ref.read(quizRepository).saveResult();
                        context.router.replace(ResultRoute());
                      }
                    },
                    child: Text(e.toString(),
                        style: Theme.of(context).textTheme.bodyLarge),
                  ),
                )
                .toList(),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
              onPressed: _pageController.hasClients
                  ? _pageController.page == 0
                      ? null
                      : () {}
                  : null,
              child: Text('Go back')),
        ],
      ),
    );
  }
}
