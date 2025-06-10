import 'package:challenge_tsoft/api/tmdb_api/models/get_movie_response.dart';
import 'package:challenge_tsoft/core/widgets/item_movie.dart';
import 'package:flutter/material.dart';

class NewTrailers extends StatelessWidget {
  final List<Movie> movies;
  const NewTrailers({
    super.key,
    required this.movies,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.03,
          vertical: MediaQuery.of(context).size.width * 0.03),
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
                ],
              )
            ],
          ),
          if (movies.isNotEmpty)
            Column(
              children: List.generate(
                  movies.length > 1 ? 2 : 1,
                  (index) => Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: ItemMovie(
                          movie: movies[index],
                          height: MediaQuery.of(context).size.height * 0.2,
                        ),
                      )),
            )
        ],
      ),
    );
  }
}
