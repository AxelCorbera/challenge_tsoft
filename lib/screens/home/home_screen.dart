import 'package:challenge_tsoft/core/const/const.dart';
import 'package:challenge_tsoft/core/services/service_manager.dart';
import 'package:challenge_tsoft/screens/home/widgets/home_app_bar.dart';
import 'package:challenge_tsoft/screens/home/widgets/home_divider.dart';
import 'package:challenge_tsoft/screens/home/widgets/home_left_panel.dart';
import 'package:challenge_tsoft/screens/home/widgets/home_right_panel.dart';
import 'package:challenge_tsoft/screens/home/widgets/size_manager.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../../api/tmdb_api/models/get_movie_response.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _homeScreenState createState() => _homeScreenState();
}

class _homeScreenState extends State<HomeScreen> {
  HomeSection _homeSection = HomeSection.movies;
  bool isPanelVisible = true;
  List<Movie> movies = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getData();
    });
  }

  getData() async {
    final response = await ServiceManager().apiTmdb.moviesApi.getMovie();
    if (response.results != null) {
      for (var m in response.results!) {
        movies.add(m);
      }
    }
    setState(() {
      print('se guardaron ${movies.length} imagenes');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _body());
  }

  Widget _body() {
    return Column(
      children: [
        HomeAppBar(
            current: _homeSection,
            changeHomeSelection: (hs) {
              setState(() {
                _homeSection = hs;
              });
            }),
        const HomeDivider(),
        content()
      ],
    );
  }

  Widget content() {
    return Expanded(
      child: Stack(
        children: [
          Row(
            children: [
              HomeLeftPanel(
                isPanelVisible: isPanelVisible,
                movies: movies,
              ),
              Container(
                color: Colors.white,
                width: 0.2,
              ),
              HomeRightPanel(child: Column())
            ],
          ),
          SizeManager(
              changePanelVision: () {
                setState(() {
                  isPanelVisible = !isPanelVisible;
                });
              },
              isPanelVisible: isPanelVisible)
        ],
      ),
    );
  }
}
