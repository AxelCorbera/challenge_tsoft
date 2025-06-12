import 'package:challenge_tsoft/core/theme/app_theme.dart';
import 'package:challenge_tsoft/providers/genres_provider.dart';
import 'package:challenge_tsoft/providers/home_section_provider.dart';
import 'package:challenge_tsoft/providers/visibility_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/home/home_screen.dart';

/// [MyApp] Configura el tema de la app, define las rutas y desactiva la etiqueta
/// de debug.
///
/// Cuenta con varios [ChangeNotifierProvider] para exponer distintos
/// cambios que afectan globalmente a la aplicación
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => VisibilityProvider()),
        ChangeNotifierProvider(create: (_) => HomeSectionProvider()),
        ChangeNotifierProvider(create: (_) => GenresProvider()),
      ],
      child: MaterialApp(
        title: 'Challenge_tsoft',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.darktheme,
        initialRoute: '/',
        routes: {
          '/': (context) => const HomeScreen(),
        },
      ),
    );
  }
}
