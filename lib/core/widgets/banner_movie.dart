import 'package:flutter/material.dart';

import '../../api/tmdb_api/models/get_movie_response.dart';

class BannerMovie extends StatelessWidget {
  final Movie movie;
  final double height;
  final double? width;
  const BannerMovie({
    super.key,
    required this.movie,
    required this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    String url = 'https://image.tmdb.org/t/p/original';
    return SizedBox(
      height: height,
      width: width,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(url + movie.posterPath!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            right: 20,
            top: 10,
            child: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 4.0),
                  child: SizedBox(
                      width: 15,
                      height: 15,
                      child: Icon(
                        Icons.remove_red_eye_outlined,
                        size: 12,
                      )),
                ),
                Text(
                  '${movie.voteAverage! % 2 == 0 ? movie.voteAverage!.toStringAsPrecision(1) : movie.voteAverage!.toStringAsPrecision(2)} M',
                  style: const TextStyle(
                      fontSize: 10, fontWeight: FontWeight.w600),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
