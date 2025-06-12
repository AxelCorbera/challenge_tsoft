import 'package:challenge_tsoft/core/widgets/item_movie.dart';
import 'package:challenge_tsoft/api/tmdb_api/models/get_movie_response.dart';
import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

final movieExample = Movie(
  title: 'A Minecraft Movie',
  backdropPath: '/yFHHfHcUgGAxziP1C3lLt0q2T4s.jpg',
  overview:
      'Four misfits find themselves struggling with ordinary problems when they are suddenly pulled through a mysterious portal into the Overworld: a bizarre, cubic wonderland that thrives on imagination. To get back home, they\'ll have to master this world while embarking on a magical quest with an unexpected, expert crafter, Steve.',
  voteAverage: 8.3,
  releaseDate: DateTime(2021, 12, 17),
);

Story itemMovieStory = Story(
    name: 'ItemMovie',
    description: '''
`ItemMovie` muestra una tarjeta de película interactiva.
Incluye imagen de fondo, detalles como título y descripción, y elementos interactivos como sliders de volumen y brillo. Permite alternar entre vista rápida y vista detallada.
''',
    builder: (context) {
      final k = context.knobs;
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SizedBox(
            width: MediaQuery.of(context).size.width / 4,
            child: ItemMovie(
              movie: movieExample,
              height:
                  k.slider(label: 'Height', initial: 220, min: 200, max: 220),
              showPopularity:
                  k.boolean(label: 'Show Popularity', initial: true),
              showViewers: k.boolean(label: 'Show Viewers', initial: true),
              isPopular: k.boolean(label: 'Is Popular', initial: true),
              outstanding: k.boolean(label: 'Outstanding', initial: true),
              showDescription:
                  k.boolean(label: 'Show Description', initial: false),
              seenUntil: Duration(
                  minutes: k
                      .slider(
                          label: 'Seen Minutes', initial: 10, min: 0, max: 150)
                      .toInt()),
            ),
          ),
        ),
      );
    });
