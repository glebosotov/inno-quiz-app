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
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      body: SafeArea(
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            constraints: BoxConstraints(
              maxWidth: 400,
              maxHeight: MediaQuery.of(context).size.height * 0.7,
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
                          color:
                              Theme.of(context).colorScheme.secondaryContainer,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const SizedBox(height: 20),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: Text(
                                widget.quiz.questions[index].text,
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                                maxLines: 5,
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const SizedBox(height: 20),
                            Spacer(),
                            ...widget.quiz.questions[index].answers.entries
                                .map(
                                  (e) => Padding(
                                    padding: const EdgeInsets.only(
                                      bottom: 8.0,
                                      right: 16,
                                      left: 16,
                                    ),
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        foregroundColor: Colors.black87,
                                        side: BorderSide(
                                          color: Colors.black12,
                                        ),
                                        backgroundColor: Theme.of(context)
                                            .colorScheme
                                            .secondaryContainer,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                      onPressed: () {
                                        setState(() {});
                                        ref.read(quizRepository).updateResult(
                                            widget
                                                .quiz
                                                .questions[_pageController.page!
                                                    .ceil()]
                                                .id,
                                            e.key);
                                        if (widget.quiz.questions.length - 1 >
                                            _pageController.page!) {
                                          _pageController.nextPage(
                                              duration: const Duration(
                                                  milliseconds: 150),
                                              curve: Curves.easeIn);
                                        } else {
                                          ref.read(quizRepository).saveResult();
                                          context.router.replace(ResultRoute());
                                        }
                                      },
                                      child: Text(
                                        e.value,
                                        style:
                                            Theme.of(context).textTheme.button,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                            const SizedBox(height: 16),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                const SizedBox(height: 20),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black87,
                    backgroundColor:
                        Theme.of(context).colorScheme.tertiaryContainer,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    if (_pageController.hasClients &&
                        _pageController.page != 0) {
                      _pageController.previousPage(
                        duration: const Duration(milliseconds: 150),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  icon: Icon(
                    Icons.arrow_back_rounded,
                    size: 16,
                  ),
                  label: Text('Go back'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
