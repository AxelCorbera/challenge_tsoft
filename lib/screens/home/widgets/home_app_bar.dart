import 'package:challenge_tsoft/core/const/const.dart';
import 'package:challenge_tsoft/screens/home/widgets/option_button.dart';
import 'package:challenge_tsoft/screens/home/widgets/section_button.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  final HomeSection current;
  final Function(HomeSection) changeHomeSelection;

  const HomeAppBar({
    super.key,
    required this.current,
    required this.changeHomeSelection,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.08,
        child: Row(
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
                        changeHomeSelection(HomeSection.movies);
                      },
                    ),
                    SectionButton(
                      text: 'TV show',
                      type: HomeSection.tvShows,
                      current: current,
                      onTap: () {
                        changeHomeSelection(HomeSection.tvShows);
                      },
                    ),
                    SectionButton(
                      text: 'Animations',
                      type: HomeSection.animations,
                      current: current,
                      onTap: () {
                        changeHomeSelection(HomeSection.animations);
                      },
                    ),
                    SectionButton(
                      text: 'Plans',
                      type: HomeSection.plans,
                      current: current,
                      onTap: () {
                        changeHomeSelection(HomeSection.plans);
                      },
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OptionButton(
                        icon: 'assets/icons/search_btn.png', onTap: () {}),
                    OptionButton(
                        icon: 'assets/icons/circle_btn.png', onTap: () {}),
                    OptionButton(
                        icon: 'assets/icons/categories_btn.png', onTap: () {})
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
