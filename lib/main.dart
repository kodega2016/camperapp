import 'package:camper_app/src/injection_container.dart' as di;
import 'package:component_library/component_library.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Camper App',
      routerConfig: di.sl<GoRouter>(),
      theme: FlexThemeData.light(
        scheme: FlexScheme.outerSpace,
        fontFamily: GoogleFonts.abel().fontFamily,
      ).copyWith(),
    );
  }
}
