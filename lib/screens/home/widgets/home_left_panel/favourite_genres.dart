import 'package:challenge_tsoft/data/test_data.dart';
import 'package:challenge_tsoft/providers/genres_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// [FavouriteGenres] muestra una sección de géneros favoritos
/// y posibles géneros adicionales para agregar.
///
/// Este widget está compuesto por un título, una lista de géneros
/// seleccionados (con colores personalizados), una opción para agregar nuevos géneros,
/// y una lista de géneros adicionales disponibles.
///
/// Se utiliza en una interfaz donde se desea mostrar las preferencias
/// del usuario de manera visual.
///
/// Actualmente no es dinámico: los géneros y colores están hardcodeados en
/// el fichero 'data/test_data.dart'

class FavouriteGenres extends StatelessWidget {
  const FavouriteGenres({super.key});

  @override
  Widget build(BuildContext context) {
    final genresProvider = context.watch<GenresProvider>();
    return Container(
      width: double.infinity,
      color: const Color(0xff1E1E21),
      child: genresProvider.gettingData
          ? Container()
          : Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.04,
                  vertical: MediaQuery.of(context).size.width * 0.01),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Favourite genres',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                  ),
                  Wrap(
                    direction: Axis.horizontal,
                    children: genresProvider.listGenresSelected
                        .map((i) => InkWell(
                              onTap: () {
                                genresProvider.removeGenre(i);
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 20, right: 25),
                                child: Container(
                                    decoration: BoxDecoration(
                                        color: i.background,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 6, 10, 6),
                                      child: Text(
                                        i.name,
                                        style: const TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    )),
                              ),
                            ))
                        .toList(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: InkWell(
                      onTap: () {},
                      child: const Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 8.0),
                            child: Icon(
                              Icons.add_circle_sharp,
                              size: 16,
                              color: Color(0xffC4C4C4),
                            ),
                          ),
                          Text(
                            'Add your favourite genres',
                            style: TextStyle(
                                fontSize: 11, fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ),
                  ),
                  Wrap(
                    direction: Axis.horizontal,
                    children: genresProvider
                        .listGenresUnselected()
                        .map((i) => InkWell(
                              onTap: () {
                                genresProvider.selectNewGenre(i);
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 20, right: 25),
                                child: Container(
                                    decoration: BoxDecoration(
                                        color: i.background,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 6, 10, 6),
                                      child: Text(
                                        i.name,
                                        style: const TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    )),
                              ),
                            ))
                        .toList(),
                  ),
                ],
              ),
            ),
    );
  }
}
