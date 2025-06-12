import 'package:challenge_tsoft/core/const/const.dart';
import 'package:challenge_tsoft/data/test_data.dart';
import 'package:challenge_tsoft/providers/home_section_provider.dart';
import 'package:challenge_tsoft/screens/home/widgets/home_app_bar/option_button.dart';
import 'package:challenge_tsoft/screens/home/widgets/home_app_bar/section_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// [HomeAppBar] es un AppBar personalizado que muestra los botones de las
/// las distintas secciones y opciones de la aplicación.
///
/// Se compone de 2 grupos de Widgets, del lado izquierdo se muestran los
/// botones que corresponden a las secciones, mientras que del lado derecho
/// se muestran los botones que acceden a distintas funciones
///
/// Todos los botones se encuentran sin funciones momentaneamente

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final sectionProvider = context.watch<HomeSectionProvider>();
    final current = sectionProvider.currentSection;
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.08,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 3,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SectionButton(
                      text: 'Movies',
                      type: HomeSection.movies,
                      current: current,
                      onTap: () {
                        sectionProvider.changeSection(HomeSection.movies);
                      },
                    ),
                    SectionButton(
                      text: 'TV show',
                      type: HomeSection.tvShows,
                      current: current,
                      onTap: () {
                        sectionProvider.changeSection(HomeSection.tvShows);
                      },
                    ),
                    SectionButton(
                      text: 'Animations',
                      type: HomeSection.animations,
                      current: current,
                      onTap: () {
                        sectionProvider.changeSection(HomeSection.animations);
                      },
                    ),
                    SectionButton(
                      text: 'Plans',
                      type: HomeSection.plans,
                      current: current,
                      onTap: () {
                        sectionProvider.changeSection(HomeSection.plans);
                      },
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width * 0.04),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    OptionButton(
                        icon: 'assets/icons/search_btn.png', onTap: () {}),
                    Stack(
                      children: [
                        OptionButton(
                            icon: 'assets/icons/circle_btn.png', onTap: () {}),
                        Positioned(
                            right: 30,
                            child: Container(
                              height: 8,
                              width: 8,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xffF36F45)),
                            ))
                      ],
                    ),
                    OptionButton(
                        icon: 'assets/icons/categories_btn.png', onTap: () {}),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 4.0),
                          child: Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.white)),
                            height: 25,
                            child: ClipOval(
                                child: Image.network(userProfilePicture0)),
                          ),
                        ),
                        SizedBox(
                            height: 8,
                            child: Image.asset(
                              'assets/icons/arrow_down.png',
                              fit: BoxFit.fitHeight,
                            ))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
