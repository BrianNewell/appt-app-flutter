import 'package:appt_app/models/app_state_model.dart';
import 'package:appt_app/models/staff_model.dart';
import 'package:flutter/material.dart';
import 'package:appt_app/styles.dart';

class ApptAddStaffItems extends StatelessWidget {
  const ApptAddStaffItems({
    Key key,
    @required this.model,
  }) : super(key: key);

  final AppStateModel model;

  @override
  Widget build(BuildContext context) {
    final List<Staff> staffData = model.getStaff();

    List<Widget> staffChips = [];

    for (int index = 0; index < staffData.length; index++) {
      staffChips.add(
        Padding(
          padding: const EdgeInsets.only(top: 6, bottom: 6),
          child: ChoiceChip(
              backgroundColor: Colors.white,
              padding: EdgeInsets.all(8),
              selectedColor: Theme.of(context).accentColor,
              elevation: 2,
              avatar: CircleAvatar(
                backgroundImage: AssetImage(staffData[index].imageAsset),
              ),
              label: Text(
                staffData[index].name,
                style: Styles.mediumText,
              ),
              labelPadding: EdgeInsets.all(8),
              selected: index == model.apptPreferredStaffInCart,
              onSelected: (bool selected) {
                if (selected) {
                  model.setApptPreferredStaff(index);
                  model.setApptPreferredTime(null);
                } else {
                  model.setApptPreferredStaff(null);
                }
              }),
        ),
      );
    }

    return SliverToBoxAdapter(
      child: Container(
        padding: EdgeInsets.only(top: 16, bottom: 16),
        child: Wrap(
          alignment: WrapAlignment.spaceEvenly,
          children: staffChips,
        ),
      ),
    );
  }
}
