import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inno_quiz_app/presentation/locator.dart';
import 'package:inno_quiz_app/presentation/pages/navigation/router.dart';

class MainPage extends ConsumerStatefulWidget {
  final String? id;
  const MainPage({
    super.key,
    @PathParam('id') this.id,
  });

  @override
  ConsumerState<MainPage> createState() => _MainPageState();
}

class _MainPageState extends ConsumerState<MainPage> {
  final _textController = TextEditingController();
  String _id = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
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
              GestureDetector(
                onTap: () async {
                  await _displayTextInputDialog(context);
                },
                child: Text(
                  _getIdText() == ''
                      ? 'Looks like you are new. Have a friend invite? \nClick here'
                      : 'You are logging in from an invite (id: ${_getIdText()})',
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _textController.text.isEmpty
                    ? null
                    : () {
                        ref
                            .read(resultProvider.notifier)
                            .rebuildState((p0) => p0.inviteId = _getIdText());
                        context.router.navigate(QuizRoute(quizName: 'Quiz 1'));
                      },
                child: Text('Start Quiz'),
              ),
              const SizedBox(height: 20),
              Builder(builder: (context) {
                return ElevatedButton.icon(
                  onPressed: () {
                    showBottomSheet(
                      context: context,
                      builder: (context) => Center(
                        child: Container(
                          margin: const EdgeInsets.all(16),
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: DefaultTextStyle(
                            style: TextStyle(
                              fontSize: 16,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'What we collect:',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text('- Your username'),
                                Text('- Your answers and which quiz you took'),
                                Text('- Your score'),
                                const SizedBox(height: 20),
                                Text(
                                  'Which data can identify you:',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text('- None'),
                                const SizedBox(height: 20),
                                Text(
                                  'How can you save your progress or share it:',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                    '- Get your random ID on the result screen'),
                                const SizedBox(height: 20),
                                ElevatedButton(
                                  onPressed: () => context.router.pop(),
                                  child: Text('Close this'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  icon: Icon(Icons.info_rounded),
                  label: Text('What data do we collect?'),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  String _getIdText() {
    return _id.isNotEmpty
        ? _id
        : widget.id == ':id'
            ? ''
            : widget.id ?? '';
  }

  Future<void> _displayTextInputDialog(BuildContext context) async {
    final _textController = TextEditingController();
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Have an invite?'),
            content: TextField(
              onChanged: (value) {
                setState(() {
                  _id = value;
                });
              },
              controller: _textController,
              decoration: InputDecoration(hintText: "Enter ID"),
            ),
            actions: <Widget>[
              ElevatedButton(
                child: Text('OK'),
                onPressed: () {
                  setState(() {
                    Navigator.pop(context);
                  });
                },
              ),
            ],
          );
        });
  }
}
