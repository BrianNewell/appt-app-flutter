import 'package:flutter/material.dart';
import 'package:appt_app/styles.dart';
import 'package:appt_app/models/app_state_model.dart';
import 'package:appt_app/models/staff_model.dart';
import 'package:provider/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Image.asset(
            'assets/images/best-barber.jpg',
            semanticLabel: 'Best Barbers & Salon',
          ),
        ),
        Expanded(
          child: ListView(
            children: <Widget>[
              Text(
                'Welcome to Best Barbers & Salon!',
                textAlign: TextAlign.center,
                style: Styles.sectionTitleText,
              ),
              SizedBox(height: 6),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    '"We Don\'t',
                    textAlign: TextAlign.center,
                    style: Styles.sectionTitleText,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8),
                    child: Icon(Icons.content_cut),
                  ),
                  Text(
                    'Cut Corners"',
                    textAlign: TextAlign.center,
                    style: Styles.sectionTitleText,
                  ),
                ],
              ),
              SizedBox(height: 18),
              LandingPageBody(),
            ],
          ),
        ),
      ],
    );
  }
}

class LandingPageBody extends StatelessWidget {
  const LandingPageBody({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateModel>(
      builder: (context, model, child) {
        final List<Staff> staffData = model.getStaff();
        return Container(
          padding: EdgeInsets.only(top: 10),
          child: CarouselSlider(
            height: MediaQuery.of(context).size.height / 4,
            viewportFraction: .9,
            enlargeCenterPage: true,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 2),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            items: staffData.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset(i.imageAsset),
                  );
                },
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
