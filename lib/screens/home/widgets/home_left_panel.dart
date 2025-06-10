import 'package:challenge_tsoft/screens/home/widgets/home_left_panel/new_trailers.dart';
import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

import '../../../api/tmdb_api/models/get_movie_response.dart';
import 'home_left_panel/favourite_genres.dart';

class HomeLeftPanel extends StatelessWidget {
  final bool isPanelVisible;
  final Future<GetMovieResponse> fetchMovies;

  const HomeLeftPanel(
      {super.key, required this.isPanelVisible, required this.fetchMovies});

  @override
  Widget build(BuildContext context) {
    double panelWidth = MediaQuery.of(context).size.width * 0.3;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: isPanelVisible ? panelWidth : 0,
      child: isPanelVisible
          ? Column(
              children: [
                NewTrailers(
                  fetchMovies: fetchMovies,
                ),
                FavouriteGenres()
              ],
            )
          : null,
    );
  }
}
