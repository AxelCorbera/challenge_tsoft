import 'package:challenge_tsoft/screens/home/widgets/size_manager.dart';
import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

final sizeManagerStory = Story(
  name: 'Widgets/SizeManager',
  description: 'Controlador de visibilidad del panel izquierdo',
  builder: (context) => Scaffold(
    body: Stack(
      children: [
        SizeManager(
          isPanelVisible:
              context.knobs.boolean(label: 'Panel visible', initial: true),
          changePanelVision: () => debugPrint('Toggled'),
        ),
      ],
    ),
  ),
);
