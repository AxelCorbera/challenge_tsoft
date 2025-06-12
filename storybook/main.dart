import 'package:challenge_tsoft/core/services/service_manager.dart';
import 'package:challenge_tsoft/providers/genres_provider.dart';
import 'package:challenge_tsoft/providers/home_section_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

import 'stories/banner_movie_story.dart';
import 'stories/favourite_genres_section.dart';
import 'stories/home_app_bar_story.dart';
import 'stories/item_movie_popular_story.dart';
import 'stories/item_movie_story.dart';
import 'stories/item_movie_trailer_story.dart';
import 'stories/item_movie_watching.dart';

void main() async {
  // Asegura que Flutter esté correctamente inicializado antes de ejecutar código asíncrono.
  WidgetsFlutterBinding.ensureInitialized();
  // Carga las variables de entorno desde el archivo `.env`.
  await dotenv.load(fileName: ".env");
  // Inicializa los servicios globales como el acceso a la API.
  await ServiceManager().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => GenresProvider()),
        ChangeNotifierProvider(create: (_) => HomeSectionProvider()),
      ],
      builder: (context, child) {
        return const MyStorybookApp();
      },
    );
  }
}

class MyStorybookApp extends StatefulWidget {
  const MyStorybookApp({super.key});
  @override
  State<MyStorybookApp> createState() => _MyStorybookAppState();
}

class _MyStorybookAppState extends State<MyStorybookApp> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // Inicializa el provider de Generos
      await context.read<GenresProvider>().init();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Storybook(
      stories: [
        homeAppBarStory,
        favouriteGenresSection,
        bannerMovieStory,
        itemMovieTrailerStory,
        itemMovieWatchingStory,
        itemMoviePopularStory,
        itemMovieStory
      ],
    );
  }
}
