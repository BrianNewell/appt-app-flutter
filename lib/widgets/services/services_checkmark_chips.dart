import 'package:flutter/material.dart';

class ServicesCheckMarkedChips extends StatelessWidget {
  const ServicesCheckMarkedChips({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        alignment: WrapAlignment.center,
        spacing: 8,
        children: <Widget>[
          Chip(
            avatar: CircleAvatar(
              child: Icon(Icons.check_circle_outline),
            ),
            label: Text('Appointments'),
          ),
          Chip(
            avatar: CircleAvatar(
              child: Icon(Icons.check_circle_outline),
            ),
            label: Text('Men'),
          ),
          Chip(
            avatar: CircleAvatar(
              child: Icon(Icons.check_circle_outline),
            ),
            label: Text('Women'),
          ),
          Chip(
            avatar: CircleAvatar(
              child: Icon(Icons.check_circle_outline),
            ),
            label: Text('Pet Friendly'),
          ),
          Chip(
            avatar: CircleAvatar(
              child: Icon(Icons.check_circle_outline),
            ),
            label: Text('Childrens Welcome'),
          ),
        ],
      ),
    );
  }
}
