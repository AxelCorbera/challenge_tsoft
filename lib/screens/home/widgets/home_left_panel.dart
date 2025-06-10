import 'package:challenge_tsoft/screens/home/widgets/home_left_panel/new_trailers.dart';
import 'package:flutter/material.dart';

import '../../../api/tmdb_api/models/get_movie_response.dart';

class HomeLeftPanel extends StatelessWidget {
  final bool isPanelVisible;
  final List<Movie> movies;

  const HomeLeftPanel(
      {super.key, required this.isPanelVisible, required this.movies});

  @override
  Widget build(BuildContext context) {
    double panelWidth = MediaQuery.of(context).size.width * 0.3;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: isPanelVisible ? panelWidth : 0,
      child: isPanelVisible
          ? NewTrailers(
              movies: movies,
            )
          : null,
    );
  }
}
