import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:inno_quiz_app/presentation/pages/compare_page.dart';
import 'package:inno_quiz_app/presentation/pages/main_page.dart';
import 'package:inno_quiz_app/presentation/pages/quiz_page.dart';
import 'package:inno_quiz_app/presentation/pages/result_screen.dart';

part 'router.gr.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      page: MainPage,
      initial: true,
      path: '/signin/:id',
    ),
    CustomRoute(
      page: QuizPage,
      transitionsBuilder: TransitionsBuilders.slideLeft,
    ),
    CustomRoute(
      page: ResultPage,
      transitionsBuilder: TransitionsBuilders.slideLeft,
    ),
    CustomRoute(
      page: ComparePage,
      transitionsBuilder: TransitionsBuilders.slideLeft,
    ),
  ],
)
class AppRouter extends _$AppRouter {}
