import 'package:flutter/material.dart';

class UserHistory extends StatelessWidget {
  const UserHistory({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(
                Icons.history,
                color: Colors.blue[700],
              ),
              SizedBox(width: 4),
              Text(
                'History',
                style: TextStyle(color: Colors.blue[700]),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 8),
                child: SizedBox(width: 100, child: Text('Apr 1, 2000')),
              ),
              Flexible(child: Text('Head Shave')),
            ],
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 8),
                child: SizedBox(width: 100, child: Text('Dec 31, 1999')),
              ),
              Flexible(child: Text('Straight Razor Shave')),
            ],
          )
        ],
      ),
    );
  }
}
