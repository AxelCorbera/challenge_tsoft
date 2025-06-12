import 'package:challenge_tsoft/screens/home/widgets/home_left_panel/favourite_genres.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

Story favouriteGenresSection = Story(
    name: 'Favourite Genres Section',
    description: '''
Esta seccion muesta los generos, tanto los seleccionados como los que estan sin
seleccionar por el usuario.
Al clickear sobre un genero seleccionado, este se eliminara y los colocara en el
listado de generos sin seleccionar
Al clickear sobre un genero no seleccionado, se le asignara un color aleatorio de
una paleta de colores predefinida y pasara al listado de generos seleccionados
''',
    builder: (context) {
      return const Center(
        child: SizedBox(
            width: 500,
            child: Column(
              children: [
                FavouriteGenres(),
              ],
            )),
      );
    });
