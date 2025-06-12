import 'package:flutter/material.dart';

/// [OptionButton] muestra un boton personalizado con un icono, se utiliza dentro de la
/// clase [HomeAppBar]

class OptionButton extends StatelessWidget {
  final String icon;
  final Function()? onTap;

  const OptionButton({
    super.key,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 30.0),
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
            height: 20,
            child: Image.asset(
              icon,
              fit: BoxFit.cover,
            )),
      ),
    );
  }
}
