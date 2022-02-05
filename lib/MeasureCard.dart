import 'package:bmi_calculator_app/RoundButton.dart';
import 'package:flutter/material.dart';

class MeasureCard extends StatelessWidget {
  const MeasureCard( //constructor

      {
    Key? key,
    required this.title,
    required this.unit,
    required this.decrement,
    required this.increment,
    required this.measure,
  }) : super(key: key);

  final String title;
  final int measure;
  final String unit;
  final void Function() increment;
  final void Function() decrement;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              measure.toString(),
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(unit),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RoundButton(content: "-", onPress: decrement),
            RoundButton(content: "+", onPress: increment),
          ],
        ),
      ],
    );
  }
}
