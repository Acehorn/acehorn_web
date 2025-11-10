import 'package:flutter/material.dart';
import 'router/router.dart';
import 'theme/colors.dart';
void main() {
  AppRouter.setupRouter();
  runApp(const AcehornApp());
}

class AcehornApp extends StatelessWidget {
  const AcehornApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Acehorn | EDM',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(useMaterial3: true).copyWith(
        scaffoldBackgroundColor: AppColors.backgroundDark,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.accent),
      ),
      onGenerateRoute: AppRouter.router.generator,
      initialRoute: '/',
    );
  }
}




