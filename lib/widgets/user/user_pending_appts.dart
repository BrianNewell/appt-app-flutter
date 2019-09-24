import 'package:appt_app/platform/platform_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class UserPendingAppts extends StatelessWidget {
  const UserPendingAppts({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String dateTomorrow = new DateFormat.yMMMd()
        .format(new DateTime.now().add(new Duration(days: 1)));
    return Container(
      padding: EdgeInsets.all(16),
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(
                Icons.schedule,
                color: Colors.blue[700],
              ),
              SizedBox(width: 4),
              Text(
                'Upcoming',
                style: TextStyle(color: Colors.blue[700]),
              ),
            ],
          ),
          GestureDetector(
            onTap: () => PlatformAlertDialog(
              title: 'Upcoming Appointment',
              content: '\nIt\s too late to change now.',
              defaultActionText: 'OK',
            ).show(context),
            child: Row(
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 8),
                    child: SizedBox(
                      width: 100,
                      child: Text(
                        dateTomorrow,
                        style: TextStyle(
                            color: Colors.green,
                            decoration: TextDecoration.underline),
                      ),
                    )),
                Flexible(
                  child: Text('Professional Haircut'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
