import 'package:flutter/material.dart';

class HomeRightPanel extends StatelessWidget {
  final Widget child;

  const HomeRightPanel({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: child,
      ),
    );
  }
}
