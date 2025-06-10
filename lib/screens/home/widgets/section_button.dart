import 'package:flutter/material.dart';
import '../../../core/const/const.dart';

class SectionButton extends StatelessWidget {
  final String text;
  final HomeSection type;
  final HomeSection current;
  final void Function() onTap;

  const SectionButton({
    super.key,
    required this.text,
    required this.type,
    required this.current,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    bool isSelected = current == type;
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Center(
                child: Text(
                  text,
                  style: TextStyle(
                      color:
                          isSelected ? Colors.white : const Color(0xff606265),
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.07,
            height: MediaQuery.of(context).size.height * 0.01,
            child:
                isSelected ? Image.asset('assets/icons/section_btn.png') : null,
          ),
        ],
      ),
    );
  }
}
