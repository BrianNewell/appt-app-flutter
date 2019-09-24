import 'package:appt_app/models/app_state_model.dart';
import 'package:appt_app/models/services_model.dart';
import 'package:flutter/material.dart';
import 'package:appt_app/styles.dart';

class ApptAddServiceItems extends StatelessWidget {
  const ApptAddServiceItems({
    Key key,
    @required this.model,
  }) : super(key: key);

  final AppStateModel model;

  @override
  Widget build(BuildContext context) {
    final List<Service> servicesData = model.getServices();

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Column(
            children: <Widget>[
              Card(
                elevation: 2,
                margin: EdgeInsets.only(top: 8, bottom: 4, left: 8, right: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(32)),
                ),
                child: InkWell(
                  onTap: () {
                    model.addServiceToCart(servicesData[index].id);
                  },
                  child: ListTile(
                    contentPadding:
                        EdgeInsets.only(top: 8, bottom: 8, left: 24, right: 24),
                    dense: true,
                    leading: Container(
                      width: 60,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            servicesData[index].serviceMinutes.toString() +
                                ' Min',
                            textAlign: TextAlign.center,
                            style: Styles.mediumText,
                          ),
                          Text(
                            '\$' + servicesData[index].price,
                            style: Styles.mediumText,
                          ),
                        ],
                      ),
                    ),
                    title: Text(
                      servicesData[index].description,
                      style: Styles.mediumText,
                    ),
                    trailing:
                        Icon(Icons.add, color: Theme.of(context).accentColor),
                  ),
                ),
              ),
            ],
          );
        },
        childCount: servicesData.length,
      ),
    );
  }
}
