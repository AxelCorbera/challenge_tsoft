import 'package:challenge_tsoft/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'screens/home/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Challenge_tsoft',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darktheme,
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
      },
    );
  }
}
