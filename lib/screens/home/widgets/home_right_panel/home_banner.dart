import 'package:challenge_tsoft/api/tmdb_api/models/get_movie_response.dart';
import 'package:challenge_tsoft/core/widgets/banner_movie.dart';
import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class HomeBanner extends StatelessWidget {
  final Future<GetMovieResponse> fetchMovies;
  final bool isLeftPanelVisible;
  const HomeBanner(
      {super.key, required this.fetchMovies, required this.isLeftPanelVisible});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<GetMovieResponse>(
      future: fetchMovies,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Column(
            children: List.generate(
                1,
                (index) => Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[700],
                            borderRadius: BorderRadius.circular(20)),
                        height: MediaQuery.of(context).size.height * 0.2,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Shimmer(
                            duration: const Duration(seconds: 2),
                            child: Container(),
                          ),
                        ),
                      ),
                    )),
          );
        } else if (snapshot.hasError) {
          return const Center(child: Text('Error al cargar películas'));
        } else if (snapshot.hasData && snapshot.data!.results!.isEmpty) {
          return const Center(child: Text('No hay películas disponibles'));
        } else if (snapshot.hasData) {
          return Row(
            children: [
              Expanded(
                child: BannerMovie(
                  movie: snapshot.data!.results!.first,
                  height: MediaQuery.of(context).size.height * 0.2,
                  // width: isLeftPanelVisible
                  //     ? MediaQuery.of(context).size.width / 1.7
                  //     : MediaQuery.of(context).size.width / 1.2,
                ),
              ),
            ],
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
