import 'package:appt_app/models/app_state_model.dart';
import 'package:appt_app/services/auth_services.dart';
import 'package:appt_app/styles.dart';
import 'package:appt_app/widgets/appt_add/appt_add_cart_items.dart';
import 'package:appt_app/widgets/appt_add/appt_add_dates.dart';
import 'package:appt_app/widgets/appt_add/appt_add_service_items.dart';
import 'package:appt_app/widgets/appt_add/appt_add_staff_items.dart';
import 'package:appt_app/widgets/appt_add/appt_add_summary.dart';
import 'package:appt_app/widgets/appt_add/appt_add_times.dart';
import 'package:appt_app/widgets/utilities/sign_in.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:provider/provider.dart';

class ApptAdd extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthBase>(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          automaticallyImplyLeading: true,
          centerTitle: false,
          elevation: 1,
          title: Text(
            'Schedule Appointment',
            style: Styles.pageTitleText,
          ),
        ),
      ),
      body: StreamBuilder<User>(
        stream: auth.onAuthStateChanged,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            User user = snapshot.data;
            if (user == null) {
              return SignIn(auth: auth);
            } else {
              return UserLoggedIn();
            }
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    @required this.minHeight,
    @required this.maxHeight,
    @required this.child,
  });
  final double minHeight;
  final double maxHeight;
  final Widget child;
  @override
  double get minExtent => minHeight;
  @override
  double get maxExtent => math.max(maxHeight, minHeight);
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}

SliverPersistentHeader sectionHeader({
  Key key,
  @required Widget child,
  double minHeight = 48,
  double maxHeight = 68,
}) {
  return SliverPersistentHeader(
    pinned: true,
    delegate: _SliverAppBarDelegate(
      minHeight: minHeight,
      maxHeight: maxHeight,
      child: Container(
        color: Colors.grey[200],
        child: child,
      ),
    ),
  );
}

class UserLoggedIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateModel>(
      builder: (context, model, child) {
        return CustomScrollView(
          slivers: <Widget>[
            sectionHeader(
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 8, left: 8),
                    child: FloatingActionButton(
                      child: Text('1'),
                      mini: true,
                      onPressed: () => {},
                    ),
                  ),
                  Text(
                    'Choose Services (one, or more)',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            new ApptAddServiceItems(model: model),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(left: 8, top: 16, bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: model.totalServiceTime <= 120
                          ? Icon(
                              Icons.info_outline,
                              color: Colors.black,
                              size: 28,
                            )
                          : Icon(
                              Icons.error_outline,
                              color: Theme.of(context).accentColor,
                              size: 28,
                            ),
                    ),
                    Text(
                      'Total Time (' +
                          model.totalServiceTime.toString() +
                          ' Minutes)',
                      style: TextStyle(
                          color: model.totalServiceTime <= 120
                              ? Colors.black
                              : Theme.of(context).accentColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: model.totalServiceTime <= 120
                  ? Container()
                  : Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(bottom: 18.0),
                          child: Text(
                            'For Appointments longer than 2 hours...\nPlease, contact us',
                            style: TextStyle(
                                color: Theme.of(context).accentColor,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
            ),
            new ApptAddCartItems(model: model),
            SliverToBoxAdapter(child: SizedBox(height: 16)),
            sectionHeader(
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 8, left: 8),
                    child: FloatingActionButton(
                      child: Text('2'),
                      mini: true,
                      onPressed: () => {},
                    ),
                  ),
                  Text(
                    'Preferred Barber / Stylist',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            new ApptAddStaffItems(model: model),
            sectionHeader(
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 8, left: 8),
                    child: FloatingActionButton(
                      child: Text('3'),
                      mini: true,
                      onPressed: () => {},
                    ),
                  ),
                  Text(
                    'Date & Time',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            new ApptAddDates(model: model),
            new ApptAddTimes(model: model),
            sectionHeader(
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 8, left: 8),
                    child: FloatingActionButton(
                      child: Text('4'),
                      mini: true,
                      onPressed: () => {},
                    ),
                  ),
                  Text(
                    'Appointment Summary',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            new ApptAddSummary(model: model),
          ],
        );
      },
    );
  }
}
