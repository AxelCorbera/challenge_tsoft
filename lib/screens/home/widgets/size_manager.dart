import 'dart:math';
import 'package:challenge_tsoft/providers/visibility_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// [SizeManager] es un botón circular animado que tiene como objetivo activar/desactivar
/// la visibilidad del panel izquierdo de la pantalla incial
///
/// Contiene un [AnimatedPositioned] que traslada la posicion del Widget al ser
/// utilizado
///
/// Tambien contiene un [AnimatedRotation] cuyo child se trata de un [Icon]
/// que realiza una rotacion de 180º al utilizar dicho [SizeManager]

class SizeManager extends StatelessWidget {
  const SizeManager({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isVisible = context.watch<VisibilityProvider>().isVisible;
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final leftPanelWidth = isVisible ? screenWidth * 0.3 : 0.0;
    final iconSize = min(screenWidth * 0.03, 30.0);
    return AnimatedPositioned(
      top: screenHeight * 0.11 - 15,
      left: leftPanelWidth + 2 + (isVisible ? -15 : 0),
      duration: const Duration(milliseconds: 300),
      child: GestureDetector(
        onTap: () {
          context.read<VisibilityProvider>().toggleVisibility();
        },
        child: Container(
          width: 30,
          height: 30,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xffc4c4c4),
          ),
          child: AnimatedRotation(
            duration: const Duration(milliseconds: 300),
            turns: isVisible ? 0.5 : 0.0,
            child: Icon(
              Icons.arrow_right,
              color: Colors.white,
              size: iconSize,
            ),
          ),
        ),
      ),
    );
  }
}
