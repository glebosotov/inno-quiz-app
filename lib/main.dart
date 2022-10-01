import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inno_quiz_app/presentation/locator.dart';
import 'package:inno_quiz_app/presentation/pages/navigation/router.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final app = await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform);
  log(app.toString());
  initLocator();
  runApp(
    ProviderScope(
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late AppRouter appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: appRouter.delegate(),
      routeInformationParser: appRouter.defaultRouteParser(),
      title: 'Quiz App',
      theme: ThemeData(
        fontFamily: 'Roboto',
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyanAccent),
      ),
    );
  }
}
