import 'package:challenge_tsoft/screens/home/widgets/home_app_bar.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

Story homeAppBarStory = Story(
    name: 'Home App Bar Story',
    description: '''
Es un App Bar personalizado que se divide en 2 grupos de Widget, del lado izquierdo
estan los botones que realizan la navegacion en las distintas pantallas de la Aplicación.
Del lado derecho se encuentran los botones que acceden a diversas funciones.
''',
    builder: (context) {
      return const HomeAppBar();
    });
