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
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<MainRouteArgs>(
          orElse: () => MainRouteArgs(id: pathParams.optString('id')));
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: MainPage(
          key: args.key,
          id: args.id,
        ),
      );
    },
    QuizRoute.name: (routeData) {
      final args =
          routeData.argsAs<QuizRouteArgs>(orElse: () => const QuizRouteArgs());
      return CustomPage<dynamic>(
        routeData: routeData,
        child: QuizPage(
          quizName: args.quizName,
          key: args.key,
        ),
        transitionsBuilder: TransitionsBuilders.slideLeft,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ResultRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const ResultPage(),
        transitionsBuilder: TransitionsBuilders.slideLeft,
        opaque: true,
        barrierDismissible: false,
      );
    },
    CompareRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const ComparePage(),
        transitionsBuilder: TransitionsBuilders.slideLeft,
        opaque: true,
        barrierDismissible: false,
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: '/signin/:id',
          fullMatch: true,
        ),
        RouteConfig(
          MainRoute.name,
          path: '/signin/:id',
        ),
        RouteConfig(
          QuizRoute.name,
          path: '/quiz-page',
        ),
        RouteConfig(
          ResultRoute.name,
          path: '/result-page',
        ),
        RouteConfig(
          CompareRoute.name,
          path: '/compare-page',
        ),
      ];
}

/// generated route for
/// [MainPage]
class MainRoute extends PageRouteInfo<MainRouteArgs> {
  MainRoute({
    Key? key,
    String? id,
  }) : super(
          MainRoute.name,
          path: '/signin/:id',
          args: MainRouteArgs(
            key: key,
            id: id,
          ),
          rawPathParams: {'id': id},
        );

  static const String name = 'MainRoute';
}

class MainRouteArgs {
  const MainRouteArgs({
    this.key,
    this.id,
  });

  final Key? key;

  final String? id;

  @override
  String toString() {
    return 'MainRouteArgs{key: $key, id: $id}';
  }
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

/// generated route for
/// [ComparePage]
class CompareRoute extends PageRouteInfo<void> {
  const CompareRoute()
      : super(
          CompareRoute.name,
          path: '/compare-page',
        );

  static const String name = 'CompareRoute';
}
