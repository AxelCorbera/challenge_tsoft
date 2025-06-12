import 'package:flutter/material.dart';

/// [AppTheme] contiene los temas personalizados utilizados en la aplicación.
///
/// Actualmente incluye un único tema oscuro [`darktheme`],
/// el cual define colores, fuentes y estilo general de la UI.
///
/// Se utiliza para configurar el `ThemeData` de la aplicación
/// en el archivo principal 'main.dart'
class AppTheme {
  static ThemeData get darktheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: const Color(0xff17171B),
      fontFamily: 'Quicksand',
    );
  }
}
