// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    MainRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: const MainPage(),
      );
    },
    QuizRoute.name: (routeData) {
      final args =
          routeData.argsAs<QuizRouteArgs>(orElse: () => const QuizRouteArgs());
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: QuizPage(
          quizName: args.quizName,
          key: args.key,
        ),
      );
    },
    ResultRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: const ResultPage(),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          MainRoute.name,
          path: '/',
        ),
        RouteConfig(
          QuizRoute.name,
          path: '/quiz-page',
        ),
        RouteConfig(
          ResultRoute.name,
          path: '/result-page',
        ),
      ];
}

/// generated route for
/// [MainPage]
class MainRoute extends PageRouteInfo<void> {
  const MainRoute()
      : super(
          MainRoute.name,
          path: '/',
        );

  static const String name = 'MainRoute';
}

/// generated route for
/// [QuizPage]
class QuizRoute extends PageRouteInfo<QuizRouteArgs> {
  QuizRoute({
    String quizName = 'Quiz 1',
    Key? key,
  }) : super(
          QuizRoute.name,
          path: '/quiz-page',
          args: QuizRouteArgs(
            quizName: quizName,
            key: key,
          ),
        );

  static const String name = 'QuizRoute';
}

class QuizRouteArgs {
  const QuizRouteArgs({
    this.quizName = 'Quiz 1',
    this.key,
  });

  final String quizName;

  final Key? key;

  @override
  String toString() {
    return 'QuizRouteArgs{quizName: $quizName, key: $key}';
  }
}

/// generated route for
/// [ResultPage]
class ResultRoute extends PageRouteInfo<void> {
  const ResultRoute()
      : super(
          ResultRoute.name,
          path: '/result-page',
        );

  static const String name = 'ResultRoute';
}
