import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:inno_quiz_app/presentation/pages/main_page.dart';
import 'package:inno_quiz_app/presentation/pages/quiz_page.dart';

part 'router.gr.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: MainPage, initial: true),
    AutoRoute(page: QuizPage),
  ],
)
class AppRouter extends _$AppRouter {}
