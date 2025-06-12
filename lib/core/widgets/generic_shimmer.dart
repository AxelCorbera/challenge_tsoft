import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

/// [GenericShimmer] es un Widget reutilizable para mostrar un shimmer de carga
///
/// el valor por defecto de la duracion es de 2 segundos.
class GenericShimmer extends StatelessWidget {
  final double height;
  const GenericShimmer({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey[700], borderRadius: BorderRadius.circular(20)),
        height: height,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Shimmer(
            duration: const Duration(seconds: 2),
            child: Container(),
          ),
        ),
      ),
    );
  }
}
