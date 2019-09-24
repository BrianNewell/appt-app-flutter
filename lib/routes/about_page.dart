import 'package:appt_app/models/app_state_model.dart';
import 'package:appt_app/models/staff_model.dart';
import 'package:appt_app/styles.dart';
import 'package:flutter/material.dart';
import 'package:appt_app/routes/about_staff_detail_page.dart';
import 'package:appt_app/widgets/staff/staff_tile.dart';
import 'package:provider/provider.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 16),
          new AboutBlub(),
          new AboutStaffIntro(),
          new AboutStaff(),
          SizedBox(height: 80),
        ],
      ),
    );
  }
}

class AboutBlub extends StatelessWidget {
  const AboutBlub({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Experienced in the Tonsorial Arts',
            style: Styles.sectionTitleText,
          ),
          SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(22),
            color: Colors.blueGrey[100],
            child: Text(
              '"Tonsorial" is a fancy word that describes the work of those who give shaves and haircuts. (It can apply more broadly to hairdressers as well.) It derives from the Latin verb tondēre, meaning "to shear, clip or crop." (Another descendant, "tonsor," is an archaic word for a barber.)',
              textAlign: TextAlign.justify,
            ),
          ),
        ],
      ),
    );
  }
}

class AboutStaffIntro extends StatelessWidget {
  const AboutStaffIntro({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 10, left: 20),
      child: Text(
        'Meet Our Talented Team:',
        style: Styles.sectionTitleText,
      ),
    );
  }
}

class AboutStaff extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateModel>(builder: (context, model, child) {
      final List<Staff> staffData = model.getStaff();

      return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: staffData.length,
        itemBuilder: (context, int) {
          return Card(
            elevation: 2,
            margin: EdgeInsets.all(8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(32)),
            ),
            child: InkWell(
              child: new StaffTile(staffData: staffData[int]),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) {
                    return new AboutPageStaffDetailPage(
                        staffData: staffData[int]);
                  }),
                );
              },
            ),
          );
        },
      );
    });
  }
}
