import 'dart:ui';
import 'package:challenge_tsoft/core/services/service_manager.dart';
import 'package:challenge_tsoft/core/widgets/item_movie/popular_blur.dart';
import 'package:challenge_tsoft/core/widgets/item_movie/trailer_blur.dart';
import 'package:challenge_tsoft/core/widgets/item_movie/watching_blur.dart';
import 'package:challenge_tsoft/data/test_data.dart';
import 'package:flutter/material.dart';

import '../../api/tmdb_api/models/get_movie_response.dart';

/// Widget [ItemMovie] que muestra una tarjeta detallada de una película.
///
/// Incluye la imagen de fondo (`backdropPath`), una sección inferior con el
/// título, país (placeholder fijo), fecha de publicación (en días desde el lanzamiento)
/// y duración estimada (valor fijo por ahora). También puede mostrar la popularidad
/// con un ícono y promedio de votos si [showPopularity] está en `true`.
///
/// El valor placeholder se encuentra estatico debido a que la respuesta JSON
/// no contiene un valor de tipo 'Country' para asignar el país
///
/// Este widget se usa principalmente para representar una película en listas o grids.
///
/// Parámetros:
/// - [movie]: Objeto [Movie] con los datos de la película.
/// - [height]: Altura del widget.
/// - [showPopularity]: Si es `true`, muestra la popularidad arriba a la derecha.
/// - [showViewers]: Si es `true`, muestra la imagen de perfil en miniatura de los
/// usuarios que estan mirando en ese momento.
/// - [seenUntil]: Si es `true` muestra [WatchingBlur] en la parte inferior.
/// Posee Duracion vista hasta el momento en caso de haber comenzado a
/// ver la pelicula.
/// - [isPopular]: Si es `true` muestra [PopularBlur] en la parte inferior. Posee
/// un rating de votos.
/// - [outstanding]: Si es `true` muestra un texto destacado en la esquina superior
/// izquierda
/// - [showDescription]: Si es `true` mostrara el titulo, pais, y detalles sobre la pelicula
/// ocultando cualquier otro widget activo
///
/// Posee un [GestureDetector] en la imagen de fondo que al ejecutarse actualiza
/// el estado del Widget alternando el valor de [showDescription]
///
/// Posee Sliders para cuyo valores oscilan entre 0.0 y 1.0 para cambiar tanto
/// el volumen como el brillo
class ItemMovie extends StatefulWidget {
  final Movie movie;
  final double height;
  final bool showPopularity;
  final bool showViewers;
  final Duration? seenUntil;
  final bool isPopular;
  final bool outstanding;
  final bool showDescription;

  const ItemMovie(
      {super.key,
      required this.movie,
      required this.height,
      this.showPopularity = false,
      this.showViewers = false,
      this.seenUntil,
      this.isPopular = false,
      this.outstanding = false,
      this.showDescription = false});

  @override
  State<ItemMovie> createState() => _ItemMovieState();
}

class _ItemMovieState extends State<ItemMovie> {
  late Movie movie;
  late double height;
  late bool showPopularity;
  late bool showViewers;
  late Duration? seenUntil;
  late bool isPopular;
  late bool outstanding;
  late bool showDescription;
  double volume = 0.5;
  bool showVolume = false;
  double brightness = 0.8;
  bool showBrightness = false;

  @override
  void initState() {
    super.initState();
    movie = widget.movie;
    height = widget.height;
    showPopularity = widget.showPopularity;
    showViewers = widget.showViewers;
    seenUntil = widget.seenUntil;
    isPopular = widget.isPopular;
    outstanding = widget.outstanding;
    showDescription = widget.showDescription;
  }

  void _toggleDescription() {
    setState(() {
      showDescription = !showDescription;
    });
  }

  void _toggleVolume() {
    setState(() {
      showBrightness = false;
      showVolume = !showVolume;
    });
  }

  void _toggleBrightness() {
    setState(() {
      showVolume = false;
      showBrightness = !showBrightness;
    });
  }

  @override
  Widget build(BuildContext context) {
    String url = ServiceManager().apiTmdb.moviesApi.urlHostImage;

    return SizedBox(
      height: height,
      child: Stack(
        children: [
          // Imagen de fondo
          GestureDetector(
            onTap: () {
              _toggleDescription();
            },
            child: ClipRRect(
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
          ),

          // Mas detalle
          if (showDescription)
            GestureDetector(
              onTap: () {
                _toggleDescription();
              },
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xff333333).withOpacity(0.9),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          movie.title!,
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w700),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          'Country: United State',
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              color: Color(0xffCACACA)),
                        ),
                      ),
                      SizedBox(
                        height: height / 3,
                        child: Text(
                          movie.overview!,
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                          maxLines: 3,
                          style: const TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

          // Popularidad
          if (!showDescription && showPopularity)
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
                      child: Icon(Icons.remove_red_eye_outlined, size: 12),
                    ),
                  ),
                  Text(
                    '${movie.voteAverage! % 2 == 0 ? movie.voteAverage!.toStringAsPrecision(1) : movie.voteAverage!.toStringAsPrecision(2)} M',
                    style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
            ),

          // Viendo
          if (!showDescription && showViewers && !outstanding)
            Positioned(
                left: 20,
                top: 10,
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
                                        border:
                                            Border.all(color: Colors.white)),
                                    height: height / 10,
                                    child: ClipOval(
                                        child: Image.network(
                                            listUserProfilesPictures[index])),
                                  ),
                                )),
                      ),
                    ),
                    Text(
                      '${listUserProfilesPictures.length} Viewers',
                      style: const TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 10),
                    )
                  ],
                )),

          // Destacado
          if (!showDescription && outstanding)
            Positioned(
              left: 20,
              top: 10,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(right: 4.0),
                            child: Text(
                              '#1 Trending',
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.w600),
                            ),
                          ),
                          SizedBox(
                            width: 8,
                            child: Image.asset(
                              'assets/icons/fire.png',
                              fit: BoxFit.contain,
                            ),
                          )
                        ],
                      ),
                    )),
              ),
            ),

          // Slider de volumen
          if (showVolume)
            Positioned(
                bottom: height / 3,
                right: 20,
                child: Column(
                  children: [
                    const Icon(
                      Icons.volume_up_rounded,
                      size: 15,
                    ),
                    SizedBox(
                      height: height / 2,
                      child: RotatedBox(
                        quarterTurns: -1,
                        child: SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            thumbColor: Colors.white,
                            thumbShape: const RoundSliderThumbShape(
                                enabledThumbRadius: 6),
                            overlayShape: const RoundSliderOverlayShape(
                                overlayRadius: 12),
                          ),
                          child: Slider(
                              thumbColor: Colors.white,
                              inactiveColor: Color(0xffC4C4C4),
                              activeColor: Colors.white,
                              value: volume,
                              onChanged: (value) {
                                setState(() {
                                  volume = value;
                                });
                              }),
                        ),
                      ),
                    ),
                  ],
                )),

          // Slider de brillo
          if (showBrightness)
            Positioned(
                bottom: height / 3,
                right: 20,
                child: Column(
                  children: [
                    const Icon(
                      Icons.wb_sunny,
                      size: 15,
                    ),
                    SizedBox(
                      height: height / 2,
                      child: RotatedBox(
                        quarterTurns: -1,
                        child: SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            thumbColor: Colors.white,
                            thumbShape: const RoundSliderThumbShape(
                                enabledThumbRadius: 6),
                            overlayShape: const RoundSliderOverlayShape(
                                overlayRadius: 12),
                          ),
                          child: Slider(
                              thumbColor: Colors.white,
                              inactiveColor: Color(0xffC4C4C4),
                              activeColor: Colors.white,
                              value: brightness,
                              onChanged: (value) {
                                setState(() {
                                  brightness = value;
                                });
                              }),
                        ),
                      ),
                    ),
                  ],
                )),

          // Footer borroso con título y datos
          if (!showDescription)
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
                    child: seenUntil != null
                        ? WatchingBlur(
                            movie: movie,
                            height: height,
                            seenUntil: seenUntil!,
                            onTapVolume: _toggleVolume,
                            onTapBrightness: _toggleBrightness,
                          )
                        : isPopular
                            ? PopularBlur(movie: movie, height: height)
                            : TrailerBlur(movie: movie, height: height)),
              ),
            ),
        ],
      ),
    );
  }
}
