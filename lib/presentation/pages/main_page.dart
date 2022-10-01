import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inno_quiz_app/presentation/locator.dart';
import 'package:inno_quiz_app/presentation/pages/navigation/router.dart';

class MainPage extends ConsumerStatefulWidget {
  const MainPage({super.key});

  @override
  ConsumerState<MainPage> createState() => _MainPageState();
}

class _MainPageState extends ConsumerState<MainPage> {
  final _textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 200),
              child: TextField(
                onChanged: (value) {
                  ref
                      .read(resultProvider.notifier)
                      .rebuildState((p0) => p0.username = value);
                  setState(() {});
                },
                controller: _textController,
                decoration: InputDecoration(
                  hintText: 'Enter your name',
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _textController.text.isEmpty
                  ? null
                  : () =>
                      context.router.navigate(QuizRoute(quizName: 'Quiz 1')),
              child: Text('Start Quiz'),
            ),
          ],
        ),
      ),
    );
  }
}
