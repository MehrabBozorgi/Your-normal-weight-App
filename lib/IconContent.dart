import 'package:flutter/material.dart';
import 'package:flutter_bmi_calculator/Constans.dart';

class IconContent extends StatelessWidget {
  final IconData icon;
  final String label;

  const IconContent({@required this.icon, this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80,
        ),
        SizedBox(
          height: 15,
        ),
        Text(label, style: KLabelTextStyle,)
      ],
    );
  }
}