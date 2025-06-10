import 'package:challenge_tsoft/core/widgets/banner_movie.dart';
import 'package:challenge_tsoft/screens/home/widgets/home_right_panel/home_banner.dart';
import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

import '../../../api/tmdb_api/models/get_movie_response.dart';
import '../../../core/widgets/item_movie.dart';

class HomeRightPanel extends StatelessWidget {
  final Future<GetMovieResponse> fetchMovies;
  final bool isLeftPanelVisible;
  const HomeRightPanel(
      {super.key, required this.fetchMovies, required this.isLeftPanelVisible});

  @override
  Widget build(BuildContext context) {
    double panelWidth = MediaQuery.of(context).size.width * 0.69;
    return Container(
      width: isLeftPanelVisible
          ? panelWidth
          : MediaQuery.of(context).size.width * 0.98,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.04,
            vertical: MediaQuery.of(context).size.width * 0.02),
        child: Column(
          children: [
            HomeBanner(
              fetchMovies: fetchMovies,
              isLeftPanelVisible: isLeftPanelVisible,
            )
          ],
        ),
      ),
    );
  }
}
