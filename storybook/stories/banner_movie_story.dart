import 'package:challenge_tsoft/core/widgets/banner_movie.dart';
import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:challenge_tsoft/api/tmdb_api/models/get_movie_response.dart';

final movieExample = Movie(
  title: 'A Minecraft Movie',
  backdropPath: '/yFHHfHcUgGAxziP1C3lLt0q2T4s.jpg',
  overview:
      'Four misfits find themselves struggling with ordinary problems when they are suddenly pulled through a mysterious portal into the Overworld: a bizarre, cubic wonderland that thrives on imagination. To get back home, they\'ll have to master this world while embarking on a magical quest with an unexpected, expert crafter, Steve.',
  voteAverage: 8.3,
  releaseDate: DateTime(2021, 12, 17),
);

Story bannerMovieStory = Story(
    name: 'Banner Movie',
    description: '''
BannerMovie muestra un póster de película con un indicador de viewers y un boton para comenzar a verla
''',
    builder: (context) {
      return BannerMovie(
        movie: movieExample,
        height: 134,
        width: 834,
      );
    });
