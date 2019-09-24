import 'package:flutter/material.dart';

class ServicesRatings extends StatelessWidget {
  const ServicesRatings({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Row(
          children: <Widget>[
            Text('4.8'),
            Icon(Icons.stars, color: Colors.red),
            Icon(Icons.stars, color: Colors.red),
            Icon(Icons.stars, color: Colors.red),
            Icon(Icons.stars, color: Colors.red),
            Icon(Icons.stars, color: Colors.red),
          ],
        ),
        Row(
          children: <Widget>[
            Text('248 '),
            Text(
              'Customer Reviews',
              style: TextStyle(
                color: Colors.red[600],
                decoration: TextDecoration.underline,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
