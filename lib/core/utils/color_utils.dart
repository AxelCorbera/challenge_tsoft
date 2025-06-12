import 'dart:math';
import 'package:flutter/material.dart';

/// [ColorUtils] es una clase de ayuda que contiene una lista de colores
/// predefinidos
///
/// Posee una funcion para generar un color aleatorio del listado predefinido

class ColorUtils {
  static final List<Color> _predefinedColors = [
    const Color(0xffF36F45),
    Colors.blue,
    Colors.green,
    Colors.orange,
    const Color(0xff8769FF),
    Colors.pink,
    Colors.teal,
    const Color(0xff61D1EA),
    Colors.amber,
  ];

  static final Random _random = Random();

  /// Retorna un color aleatorio del listado predefinido
  static Color getRandomColor() {
    return _predefinedColors[_random.nextInt(_predefinedColors.length)];
  }
}
