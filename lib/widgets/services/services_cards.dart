import 'package:appt_app/models/services_model.dart';
import 'package:flutter/material.dart';

class ServicesCards extends StatelessWidget {
  final List<Service> servicesData;

  const ServicesCards({Key key, @required this.servicesData})
      : assert(servicesData != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        color: Colors.blueGrey[100],
        padding: EdgeInsets.only(left: 16, right: 8),
        child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: servicesData.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              padding: EdgeInsets.only(top: 8, bottom: 8),
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: 30,
                    child: Text(
                      '\$${servicesData[index].price}',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    width: 60,
                    child: Icon(
                      Icons.all_inclusive,
                      size: 22,
                    ),
                  ),
                  Flexible(
                    child: Text('${servicesData[index].description}'),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
