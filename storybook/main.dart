import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

import 'stories/size_manager_story.dart';

void main() {
  runApp(const MyStorybookApp());
}

class MyStorybookApp extends StatelessWidget {
  const MyStorybookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Storybook(
      stories: [
        sizeManagerStory,
      ],
    );
  }
}
