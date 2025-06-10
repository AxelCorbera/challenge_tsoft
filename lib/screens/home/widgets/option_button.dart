import 'package:flutter/material.dart';
import '../../../core/const/const.dart';

class OptionButton extends StatelessWidget {
  final String icon;
  final Function()? onTap;

  const OptionButton({
    super.key,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 30.0),
      child: InkWell(
        onTap: onTap,
        child: Image.asset(icon),
      ),
    );
  }
}
