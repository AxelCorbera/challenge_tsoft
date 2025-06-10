import 'dart:math';
import 'package:flutter/material.dart';

class SizeManager extends StatelessWidget {
  final Function()? changePanelVision;
  final bool isPanelVisible;
  const SizeManager(
      {super.key,
      required this.changePanelVision,
      required this.isPanelVisible});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final leftPanelWidth = isPanelVisible ? screenWidth * 0.3 : 0;
    final iconSize = min(screenWidth * 0.03, 35.0);
    return AnimatedPositioned(
      top: screenHeight * 0.15 - 20,
      left: leftPanelWidth + 2 - 20,
      duration: const Duration(milliseconds: 300),
      child: GestureDetector(
        onTap: changePanelVision,
        child: Container(
          width: 40,
          height: 40,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xffc4c4c4),
          ),
          child: AnimatedRotation(
            duration: const Duration(milliseconds: 300),
            turns: isPanelVisible ? 0.5 : 0.0,
            child: Icon(
              Icons.arrow_right,
              color: Colors.white,
              size: iconSize,
            ),
          ),
        ),
      ),
    );
  }
}
