import 'package:appt_app/models/app_state_model.dart';
import 'package:appt_app/models/staff_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:appt_app/styles.dart';

class StaffOpening {
  final int staffId;
  final DateTime opening;
  StaffOpening({this.staffId, this.opening});
}

class ApptAddTimes extends StatelessWidget {
  const ApptAddTimes({
    Key key,
    @required this.model,
  }) : super(key: key);

  final AppStateModel model;

  @override
  Widget build(BuildContext context) {
    if (model.apptPreferredDateInCart == null)
      return SliverToBoxAdapter(child: Container());

    final List<Staff> staffData = model.getStaff();
    List<StaffOpening> staffOpenings = [];

    if (model.apptPreferredStaffInCart == null) {
      for (var staffId = 0; staffId < staffData.length; staffId++) {
        addStaffOpening(staffData, staffId, staffOpenings);
      }
    } else {
      addStaffOpening(staffData, model.apptPreferredStaffInCart, staffOpenings);
    }

    List<Widget> apptChips = [];

    for (var i = 0; i < staffOpenings.length; i++) {
      String staffName = staffData[staffOpenings[i].staffId].name;
      String availableTime =
          DateFormat("h:mm a").format(staffOpenings[i].opening);
      apptChips.add(Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 8),
          child: ChoiceChip(
            padding: EdgeInsets.all(16),
            backgroundColor: Colors.white,
            elevation: 2,
            selectedColor: Theme.of(context).accentColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(80)),
            ),
            label: Text(
              '$staffName -- $availableTime',
              style: Styles.mediumText,
            ),
            selected:
                (model.apptSelectedStaffInCart == staffOpenings[i].staffId) &&
                    (model.apptPreferredTimeInCart == staffOpenings[i].opening),
            onSelected: (bool isSelected) {
              if (isSelected) {
                model.setApptSelectedStaff(staffOpenings[i].staffId);
                model.setApptPreferredTime(staffOpenings[i].opening);
              } else {
                model.setApptSelectedStaff(null);
                model.setApptPreferredTime(null);
              }
            },
          ),
        ),
      ));
    }
    return SliverToBoxAdapter(
      child: Wrap(
        children: apptChips,
      ),
    );
  }

  void addStaffOpening(
      List<Staff> staffData, int staffId, List<StaffOpening> staffOpenings) {
    for (var opening = 0;
        opening < staffData[staffId].availableTimes.length;
        opening++)
      staffOpenings.add(
        StaffOpening(
          staffId: staffId,
          opening: DateTime.parse(staffData[staffId].availableTimes[opening]),
        ),
      );
  }
}
