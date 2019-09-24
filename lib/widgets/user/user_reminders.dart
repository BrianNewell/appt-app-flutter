import 'package:flutter/material.dart';

class UserReminders extends StatefulWidget {
  const UserReminders({
    Key key,
  }) : super(key: key);

  @override
  _UserRemindersState createState() => _UserRemindersState();
}

class _UserRemindersState extends State<UserReminders> {
  bool remindUpcoming = true;
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
                Icons.notifications,
                color: Colors.blue[700],
              ),
              SizedBox(width: 4),
              Text('Reminders', style: TextStyle(color: Colors.blue[700])),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Upcoming Appointments'),
              Switch(
                value: remindUpcoming,
                onChanged: (value) {
                  setState(() {
                    remindUpcoming = value;
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
