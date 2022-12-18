import 'package:flutter/material.dart';
import 'package:typical_food/app/features/home/presenter/home_view.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const HomeView()
      },
    );
  }
}