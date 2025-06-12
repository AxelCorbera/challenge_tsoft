import 'package:challenge_tsoft/api/tmdb_api/models/get_movie_response.dart';
import 'package:flutter/material.dart';

/// [TrailerBlur] es un widget que muestra una interfaz de visualización
/// de trailer de pelicula.
///
/// Este widget se utiliza comúnmente en tarjetas o listas donde se muestra
///  botones de reproducción/pausa y detalles como duración total, título,
/// y fecha de lanzamiento.
///
/// Parámetros:
/// - [movie] Objeto de tipo [Movie] que contiene los datos de la película.
/// - [height] Altura del contenedor total del widget.
class TrailerBlur extends StatelessWidget {
  final Movie movie;
  final double height;
  const TrailerBlur({super.key, required this.movie, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height / 3,
      color: Colors.white.withOpacity(0.1),
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      width: height / 7,
                      height: height / 7,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xffc4c4c4),
                      ),
                      child: const Icon(
                        Icons.play_arrow,
                        color: Colors.white,
                        size: 20,
                      ),
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
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const Text(
                      'Country: United State', // Valor placeholder
                      style: TextStyle(
                        color: Color(0xffCACACA),
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      '${DateTime.now().difference(movie.releaseDate!).inDays}d ago',
                      style: const TextStyle(
                        color: Color(0xffCACACA),
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                      ),
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
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: height / 9,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Center(
                    child: Text(
                      '01:29',
                      style: TextStyle(
                        color: Color(0xff2C383B),
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
