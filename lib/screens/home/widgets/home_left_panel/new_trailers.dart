import 'package:challenge_tsoft/api/tmdb_api/models/get_movie_response.dart';
import 'package:challenge_tsoft/core/widgets/item_movie.dart';
import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class NewTrailers extends StatelessWidget {
  final Future<GetMovieResponse> fetchMovies;
  const NewTrailers({super.key, required this.fetchMovies});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.04,
          vertical: MediaQuery.of(context).size.width * 0.02),
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('New trailers',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 8.0),
                    child: Text('Sort By',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff606265))),
                  ),
                  Text('Today',
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w400)),
                  InkWell(
                    child: Icon(Icons.compare_arrows_outlined),
                  )
                ],
              )
            ],
          ),
          FutureBuilder<GetMovieResponse>(
            future: fetchMovies,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Column(
                  children: List.generate(
                      2,
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
                                  duration: Duration(seconds: 2),
                                  child: Container(),
                                ),
                              ),
                            ),
                          )),
                );
              } else if (snapshot.hasError) {
                return const Center(child: Text('Error al cargar películas'));
              } else if (snapshot.hasData && snapshot.data!.results!.isEmpty) {
                return const Center(
                    child: Text('No hay películas disponibles'));
              } else if (snapshot.hasData) {
                // return Column(
                //   children: List.generate(
                //       2,
                //       (index) => Padding(
                //             padding: const EdgeInsets.only(top: 10.0),
                //             child: Container(
                //               decoration: BoxDecoration(
                //                   color: Colors.grey,
                //                   borderRadius: BorderRadius.circular(20)),
                //               height: MediaQuery.of(context).size.height * 0.2,
                //               child: ClipRRect(
                //                 borderRadius: BorderRadius.circular(20),
                //                 child: Shimmer(
                //                   child: Container(),
                //                 ),
                //               ),
                //             ),
                //           )),
                // );
                return Column(
                  children: List.generate(
                      snapshot.data!.results!.length > 1 ? 2 : 1,
                      (index) => Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: ItemMovie(
                              movie: snapshot.data!.results![index],
                              height: MediaQuery.of(context).size.height * 0.2,
                            ),
                          )),
                );
              } else {
                return const SizedBox.shrink();
              }
            },
          )
        ],
      ),
    );
  }
}
