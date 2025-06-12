import 'package:challenge_tsoft/providers/visibility_provider.dart';
import 'package:challenge_tsoft/screens/home/widgets/home_left_panel/new_trailers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home_left_panel/favourite_genres.dart';

/// [HomeLeftPanel] es el panel izquierdo de la pantalla de inicio que muestra
/// las clases [NewTrailers] y [FavouriteGenres] si se encuentra visible.
///
/// Se compone de un container animado que se expande y contrae dependiendo
/// el estado de visibilidad de este panel

class HomeLeftPanel extends StatelessWidget {
  const HomeLeftPanel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isVisible = context.watch<VisibilityProvider>().isVisible;
    double panelWidth = MediaQuery.of(context).size.width * 0.3;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: isVisible ? panelWidth : 0,
      child: isVisible
          ? const Column(
              children: [NewTrailers(), FavouriteGenres()],
            )
          : null,
    );
  }
}
