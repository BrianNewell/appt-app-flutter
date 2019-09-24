import 'package:flutter/material.dart';

class ServicesQuotes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 8, right: 20),
          child: Icon(Icons.question_answer),
        ),
        Text(
            'Barber\’s push broom cuts\nPaths between chairs, fuzzy pile\nTaller than its head\n-- Calvin Olsen'),
      ],
    );
  }
}
