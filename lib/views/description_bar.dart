import 'package:flutter/material.dart';

class DescriptionBar extends StatelessWidget {
  final String? text1;
  final String? text2;
  final String? text3;
  final String? text4;
  const DescriptionBar({
    super.key,
    this.text1,
    this.text2,
    this.text3,
    this.text4,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            textAlign: TextAlign.center,
            text1 ?? '',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: Text(
            textAlign: TextAlign.center,

            text2 ?? '',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: Text(
            textAlign: TextAlign.center,
            text3 ?? '',

            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
