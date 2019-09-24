import 'package:appt_app/models/app_state_model.dart';
import 'package:appt_app/models/staff_model.dart';
import 'package:appt_app/styles.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ApptAddSummary extends StatelessWidget {
  const ApptAddSummary({
    Key key,
    @required this.model,
  }) : super(key: key);

  final AppStateModel model;

  @override
  Widget build(BuildContext context) {
    final List<Staff> staffData = model.getStaff();

    String apptDate = '';
    String apptDay = '';
    String apptTime = '';
    if (model.apptDateTimeInCart != null) {
      apptDate =
          DateFormat('MMMM d, y').format(model.apptDateTimeInCart).toString();
      apptDay = DateFormat('EEEE').format(model.apptDateTimeInCart).toString();
      apptTime =
          DateFormat('h:mm a').format(model.apptDateTimeInCart).toString();
    }

    String staffName;
    if (model.apptPreferredStaffInCart != null) {
      staffName = staffData[model.apptPreferredStaffInCart].name;
    } else {
      staffName = model.apptSelectedStaffInCart != null
          ? staffData[model.apptSelectedStaffInCart].name
          : '';
    }

    List<Widget> serviceItems = [];
    for (var i = 0; i < model.servicesInCart.length; i++) {
      final String serviceQuantity =
          model.servicesInCart.values.toList()[i].toString();
      final String serviceName = model
          .getServiceById(model.servicesInCart.keys.toList()[i])
          .description;
      serviceItems.add(
        Text(
          '$serviceQuantity x ' +
              serviceName.replaceAll(new RegExp(r' \n'), ', '),
          style: Styles.mediumText,
        ),
      );
    }

    return new SliverToBoxAdapter(
      child: Container(
        color: Colors.blueGrey[100],
        child: Padding(
          padding:
              const EdgeInsets.only(top: 20, bottom: 40, left: 40, right: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                apptDay,
                style: Styles.pageTitleText,
              ),
              Text(
                apptDate,
                style: Styles.pageTitleText,
              ),
              Text(
                apptTime,
                style: Styles.pageTitleText,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 8),
                child: Text(
                  'Barber / Stylist',
                  style: Styles.apptSectionText,
                ),
              ),
              Text(
                staffName,
                style: Styles.sectionTitleText,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 8),
                child: Text(
                  'Services',
                  style: Styles.apptSectionText,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: serviceItems,
              ),
              Divider(
                color: Colors.black,
                height: 22,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 16),
                child: RaisedButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: Icon(
                          Icons.check,
                          color: Colors.green,
                        ),
                      ),
                      Text('Looks Good.  BOOK IT!'),
                    ],
                  ),
                  color: Colors.white,
                  padding: EdgeInsets.all(16),
                  onPressed: () => {},
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    '* Disclaimer *',
                    style: TextStyle(color: Theme.of(context).accentColor),
                  ),
                  Text(
                    ' This is only a sample application',
                    style: TextStyle(color: Theme.of(context).accentColor),
                  ),
                  Text(
                    'No actual scheduling or haircuts will occur',
                    style: TextStyle(color: Theme.of(context).accentColor),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
