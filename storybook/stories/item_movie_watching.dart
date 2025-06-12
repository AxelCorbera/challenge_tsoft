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

Story itemMovieWatchingStory = Story(
    name: 'Item Movie Watching',
    description: '''
`ItemMovie` muestra una tarjeta de película que se ha comenzado a mirar.
Incluye imagen de fondo, detalles como título y descripción, y elementos interactivos como sliders de volumen y brillo.
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
                height: 220,
                showViewers: true,
                seenUntil: Duration(
                    minutes: k
                        .slider(
                            label: 'Seen Minutes',
                            initial: 32,
                            min: 0,
                            max: 150)
                        .toInt())),
          ),
        ),
      );
    });
