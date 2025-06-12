import 'package:flutter/material.dart';

/// [GenreChip] muestra el item 'Genero' de la pelicula
///
/// Incluye el nombre del genero y un color de fondo
class GenreChip extends StatelessWidget {
  final String label;
  final Color color;

  const GenreChip({
    required this.label,
    required this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 6, 10, 6),
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
