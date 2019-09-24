import 'package:appt_app/models/app_state_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:appt_app/styles.dart';

class ApptAddDates extends StatelessWidget {
  const ApptAddDates({
    Key key,
    @required this.model,
  }) : super(key: key);

  final AppStateModel model;

  @override
  Widget build(BuildContext context) {
    Future<Null> selectApptDate(BuildContext context) async {
      final DateTime picked = await showDatePicker(
        context: context,
        initialDate: model.apptPreferredDateInCart != null
            ? model.apptPreferredDateInCart
            : DateTime(
                DateTime.now().year, DateTime.now().month, DateTime.now().day),
        firstDate: DateTime(
            DateTime.now().year, DateTime.now().month, DateTime.now().day),
        lastDate: new DateTime.now().add(new Duration(days: 120)),
        // selectableDayPredicate: (DateTime val) =>
        //     val.weekday == 7 ? false : true,
      );
      if (picked != null) model.setApptPreferredDate(picked);
    }

    return SliverToBoxAdapter(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              color: model.apptPreferredDateInCart == null
                  ? Colors.white
                  : Theme.of(context).accentColor,
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(32)),
              ),
              child: InkWell(
                onTap: () {
                  selectApptDate(context);
                },
                child: ListTile(
                    title: model.apptPreferredDateInCart == null
                        ? Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.calendar_today,
                                  color: Theme.of(context).accentColor,
                                ),
                                SizedBox(width: 8),
                                Text(
                                  'Choose A Date',
                                  style: Styles.mediumText,
                                )
                              ],
                            ),
                          )
                        : Container(
                            color: Theme.of(context).accentColor,
                            padding: EdgeInsets.only(top: 8, bottom: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.calendar_today,
                                  // color: Theme.of(context).accentColor,
                                  color: Colors.white,
                                ),
                                SizedBox(width: 8),
                                Text(
                                  DateFormat('EEEE, MMMM d, y')
                                      .format(model.apptPreferredDateInCart),
                                  style: Styles.mediumWhiteText,
                                ),
                              ],
                            ),
                          )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
