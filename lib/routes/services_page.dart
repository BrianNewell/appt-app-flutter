import 'package:appt_app/models/app_state_model.dart';
import 'package:appt_app/models/services_model.dart';
import 'package:appt_app/widgets/services/services_cards.dart';
import 'package:appt_app/widgets/services/services_checkmark_chips.dart';
import 'package:appt_app/widgets/services/services_payments.dart';
import 'package:appt_app/widgets/services/services_quotes.dart';
import 'package:appt_app/widgets/services/services_ratings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ServicesPage extends StatelessWidget {
  const ServicesPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateModel>(builder: (context, model, child) {
      final List<Service> servicesData = model.getServices();
      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 16),
              child: new ServicesRatings(),
            ),
            new ServicesQuotes(),
            new ServicesCards(servicesData: servicesData),
            new ServicesCheckMarkedChips(),
            Divider(height: 12, color: Colors.black),
            new ServicesPayments(),
            Divider(height: 12, color: Colors.black),
            SizedBox(height: 60),
          ],
        ),
      );
    });
  }
}
