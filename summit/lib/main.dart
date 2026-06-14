import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:summit/core/router/app_router.dart';
import 'package:summit/core/theme/app_theme.dart';

void main() {
  runApp(const ProviderScope(child: SummitApp()));
}

class SummitApp extends StatelessWidget {
  const SummitApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
      theme: AppTheme.dark,
    );
  }
}
