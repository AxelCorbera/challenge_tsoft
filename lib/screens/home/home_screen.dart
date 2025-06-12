import 'package:challenge_tsoft/core/const/const.dart';
import 'package:challenge_tsoft/core/services/service_manager.dart';
import 'package:challenge_tsoft/providers/visibility_provider.dart';
import 'package:challenge_tsoft/screens/home/widgets/home_app_bar.dart';
import 'package:challenge_tsoft/screens/home/widgets/home_divider.dart';
import 'package:challenge_tsoft/screens/home/widgets/home_left_panel.dart';
import 'package:challenge_tsoft/screens/home/widgets/home_right_panel.dart';
import 'package:challenge_tsoft/screens/home/widgets/size_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../api/tmdb_api/models/get_movie_response.dart';
import '../../providers/genres_provider.dart';

/// [HomeScreen] muesta un AppBar y el contenido de la pantalla inicial.
///
/// Utiliza [HomeAppBar] como AppBar personalizado para mostrar las distintas
/// secciones y opciones de la aplicación
///
/// Debajo del AppBar personalizado muestra el contenido de la pantalla incial
/// que se compone de un [Stack] de Widgets
///
/// El primer grupo del [Stack] se agrupa en un [Row] y muestra las clases
/// [HomeLeftPanel] y [HomeRightPanel] separados por un [Container] que cumple
/// el rol de [VerticalDivider]
///
/// El segundo y ultimo elemento del [Stack] es el botón personalizado de tipo
/// [SizeManager] que se posiciona entre los Widgets [HomeLeftPanel] y
/// [HomeRightPanel]. La funcion de este Widget es activar/desactivar la
/// visibilidad de [HomeLeftPanel].

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _homeScreenState createState() => _homeScreenState();
}

class _homeScreenState extends State<HomeScreen> {
  void getInitialData() {
    context.read<GenresProvider>().init();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getInitialData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _body());
  }

  Widget _body() {
    return Column(
      children: [const HomeAppBar(), const HomeDivider(), content()],
    );
  }

  Widget content() {
    final isVisible = context.watch<VisibilityProvider>().isVisible;
    return Expanded(
      child: SingleChildScrollView(
        child: Stack(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: isVisible
                    ? MainAxisAlignment.start
                    : MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const HomeLeftPanel(),
                  Container(
                    color: Colors.white,
                    width: 0.2,
                    height: MediaQuery.of(context).size.height,
                  ),
                  const HomeRightPanel()
                ],
              ),
            ),
            const SizeManager()
          ],
        ),
      ),
    );
  }
}
