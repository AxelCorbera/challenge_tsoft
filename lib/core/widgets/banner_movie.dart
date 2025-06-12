import 'package:challenge_tsoft/core/services/service_manager.dart';
import 'package:challenge_tsoft/data/test_data.dart';
import 'package:flutter/material.dart';

import '../../api/tmdb_api/models/get_movie_response.dart';

/// Widget [BannerMovie] que muestra una tarjeta visual del póster de una película.
///
/// Incluye una imagen con bordes redondeados que se obtiene desde la URL de TMDB
/// y un pequeño indicador de vistas con un ícono y el promedio de votos (`voteAverage`).
///
/// Es utilizado comúnmente en listas horizontales o banners destacados.
///
/// Parámetros:
/// - [movie]: Objeto [Movie] que contiene los datos de la película.
/// - [height]: Altura del banner.
/// - [width]: Ancho opcional del banner (si no se especifica, tomará el tamaño máximo posible).
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
    String url = ServiceManager().apiTmdb.moviesApi.urlHostBanner;
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
          Positioned(
              left: 15,
              top: 15,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Stack(
                      children: List.generate(
                          listUserProfilesPictures.length,
                          (index) => Padding(
                                padding:
                                    EdgeInsets.only(left: (index + 1) * 12),
                                child: Container(
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(color: Colors.white)),
                                  height: height / 10,
                                  child: ClipOval(
                                      child: Image.network(
                                          listUserProfilesPictures[index])),
                                ),
                              )),
                    ),
                  ),
                  const Text(
                    '+2 friends are watching',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 10),
                  )
                ],
              )),
          Positioned(
              left: 15,
              bottom: 15,
              child: InkWell(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xffF36F45),
                      borderRadius: BorderRadius.circular(5)),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 8, 10, 8),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 4.0),
                          child: Container(
                            width: height / 8,
                            height: height / 8,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: const Color(0xffc4c4c4).withOpacity(0.5),
                            ),
                            child: const Icon(
                              Icons.play_arrow,
                              color: Colors.white,
                              size: 15,
                            ),
                          ),
                        ),
                        const Text(
                          'Watch Now',
                          style: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
