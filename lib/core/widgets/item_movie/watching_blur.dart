import 'package:challenge_tsoft/api/tmdb_api/models/get_movie_response.dart';
import 'package:challenge_tsoft/core/utils/formats_utils.dart';
import 'package:flutter/material.dart';

/// [WatchingBlur] es un widget que muestra una interfaz de visualización
/// de película cuando el usuario ha comenzado a reproducir un contenido.
///
/// Este widget se utiliza comúnmente en tarjetas o listas donde se muestra
/// el progreso de visualización de una película, e incluye un slider de
/// progreso, botones de reproducción/pausa y detalles como duración total,
/// título, y fecha de lanzamiento.
///
/// Funcionalidad:
/// - Si el tiempo visto (`seenUntil`) es menor a 5 minutos, muestra un botón
///   de reproducción junto con el título y la fecha de publicación.
/// - Si `seenUntil` es mayor, muestra una interfaz con un slider de progreso,
///   botones para pausar, ajustar configuración, volumen y pantalla completa.
///
/// Parámetros:
/// - [movie] Objeto de tipo [Movie] que contiene los datos de la película.
/// - [height] Altura del contenedor total del widget.
/// - [seenUntil] [Duration] que representa cuánto tiempo del video se ha visto.
///
/// Notas:
/// - La duración total del video está actualmente fija como 2h 34min 28s.
/// - Usa `Formats().durationToString` para convertir duraciones a texto legible.
/// - Este widget no reproduce realmente el video ni modifica estado; es puramente visual.

class WatchingBlur extends StatelessWidget {
  final Movie movie;
  final double height;
  final Duration seenUntil;
  final Function onTapVolume;
  final Function onTapBrightness;
  const WatchingBlur(
      {super.key,
      required this.movie,
      required this.height,
      required this.seenUntil,
      required this.onTapVolume,
      required this.onTapBrightness});

  @override
  Widget build(BuildContext context) {
    Duration seenUntil = this.seenUntil;
    // Se utiliza un valor de prueba para la duracion total
    Duration totalDuration = const Duration(hours: 2, minutes: 34, seconds: 28);
    double sliderValue = (totalDuration.inSeconds -
            (totalDuration.inSeconds - seenUntil.inSeconds))
        .toDouble();
    double sliderSecondValue = sliderValue * 2 > totalDuration.inSeconds
        ? totalDuration.inSeconds.toDouble()
        : sliderValue * 2;
    return Container(
      height: height / 3,
      color: Colors.white.withOpacity(0.1),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            flex: 2,
            child: seenUntil.inMinutes < 5
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Flexible(
                          flex: 2,
                          child: Padding(
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
                        ),
                        Flexible(
                          flex: 4,
                          child: Column(
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
                        ),
                      ],
                    ),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 12.0),
                          child: InkWell(
                            onTap: () {},
                            child: Container(
                              width: height / 7,
                              height: height / 7,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: const Color(0xffc4c4c4).withAlpha(130),
                              ),
                              child: const Icon(
                                Icons.pause,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 4,
                        child: Row(
                          children: [
                            Flexible(
                              child: Text(
                                Formats().durationToString(seenUntil),
                                style: const TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xffADADAD)),
                              ),
                            ),
                            Flexible(
                              flex: 3,
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
                                    secondaryActiveColor: Colors.white,
                                    secondaryTrackValue: sliderSecondValue,
                                    inactiveColor: Color(0xffC4C4C4),
                                    activeColor: Color(0xff8769FF),
                                    value: sliderValue,
                                    max: totalDuration.inSeconds.toDouble(),
                                    onChanged: (value) {}),
                              ),
                            ),
                            Flexible(
                              flex: 2,
                              child: Text(
                                Formats().durationToString(totalDuration),
                                style: const TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xffADADAD)),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
          ),
          Flexible(
            flex: 1,
            child: seenUntil.inMinutes < 5
                ? Padding(
                    padding: const EdgeInsets.only(right: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
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
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          height: height / 9,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Text(
                              Formats().durationToString(totalDuration),
                              style: const TextStyle(
                                color: Color(0xff2C383B),
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 15.0),
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
                      Padding(
                        padding: const EdgeInsets.only(right: 15.0),
                        child: InkWell(
                          onTap: () {
                            onTapBrightness();
                          },
                          child: SizedBox(
                              height: 12,
                              child: Image.asset(
                                'assets/icons/media_settings.png',
                                fit: BoxFit.contain,
                              )),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 15.0),
                        child: InkWell(
                          onTap: () {
                            onTapVolume();
                          },
                          child: SizedBox(
                              height: 12,
                              child: Image.asset(
                                'assets/icons/media_volume.png',
                                fit: BoxFit.contain,
                              )),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: SizedBox(
                            height: 12,
                            child: Image.asset(
                              'assets/icons/media_full_screen.png',
                              fit: BoxFit.contain,
                            )),
                      )
                    ],
                  ),
          )
        ],
      ),
    );
  }
}
