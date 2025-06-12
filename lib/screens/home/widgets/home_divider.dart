import 'package:flutter/material.dart';

/// [HomeDivider] es un widget que tiene como objetivo mostrar una separación
/// de Widgets en la interfaz.
///
/// Se utiliza una linea vertical de color en degradez que escala de un blanco
/// poco visible a un blanco fuerte y nuevamente a un blanco poco visible

class HomeDivider extends StatelessWidget {
  const HomeDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.2,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Colors.white10, Colors.white, Colors.white10])),
    );
  }
}
