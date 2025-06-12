import 'package:challenge_tsoft/providers/visibility_provider.dart';
import 'package:challenge_tsoft/screens/home/widgets/home_right_panel/continue_watching.dart';
import 'package:challenge_tsoft/screens/home/widgets/home_right_panel/home_banner.dart';
import 'package:challenge_tsoft/screens/home/widgets/home_right_panel/popular_movies.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// [HomeRightPanel] es el panel izquierdo de la pantalla de inicio que muestra
/// las clases [HomeBanner] y ..................
///
/// Se compone de un container animado que se expande y contrae dependiendo
/// el estado de visibilidad de la clase [HomeLeftPanel]
///
class HomeRightPanel extends StatelessWidget {
  const HomeRightPanel({super.key});

  @override
  Widget build(BuildContext context) {
    final isVisible = context.watch<VisibilityProvider>().isVisible;
    double panelWidth = MediaQuery.of(context).size.width * 0.69;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: isVisible ? panelWidth : MediaQuery.of(context).size.width * 0.98,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.04,
            vertical: MediaQuery.of(context).size.width * 0.02),
        child: const Column(
          children: [HomeBanner(), ContinueWatching(), PopularMovies()],
        ),
      ),
    );
  }
}
