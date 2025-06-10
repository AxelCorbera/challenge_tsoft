import 'dart:ui';

import 'package:flutter/material.dart';

import '../../api/tmdb_api/models/get_movie_response.dart';

class ItemMovie extends StatelessWidget {
  final Movie movie;
  final double height;
  final double? width;
  final bool showPopularity;
  const ItemMovie(
      {super.key,
      required this.movie,
      required this.height,
      this.width,
      this.showPopularity = false});

  @override
  Widget build(BuildContext context) {
    String url = 'https://image.tmdb.org/t/p/w500';
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
                  image: NetworkImage(url + movie.backdropPath!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          if (showPopularity)
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
          Align(
            alignment: Alignment.bottomCenter,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
                child: Container(
                  height: height / 2.7,
                  color: Colors.white.withOpacity(0.1),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 12.0),
                            child: Container(
                              width: 25,
                              height: 25,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xffc4c4c4),
                              ),
                              child: const Icon(
                                Icons.arrow_right,
                                color: Colors.white,
                                size: 22,
                              ),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                movie.title!,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w700),
                              ),
                              const Text(
                                'Country: United State', // <-- No tenemos este elemento en el JSON
                                style: TextStyle(
                                    color: Color(0xffCACACA),
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                '${DateTime.now().difference(movie!.releaseDate!).inDays.toString()}d ago',
                                style: const TextStyle(
                                    color: Color(0xffCACACA),
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: Container(
                              width: 2,
                              height: height / 8,
                              decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                      colors: [
                                    Colors.white10,
                                    Colors.white60,
                                    Colors.white10
                                  ],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter)),
                            ),
                          ),
                          Container(
                            height: height / 9,
                            width: 40,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(2.0),
                              child: Center(
                                child: Text(
                                  '01:29',
                                  style: TextStyle(
                                      color: Color(0xff2C383B),
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
