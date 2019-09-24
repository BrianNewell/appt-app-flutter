import 'package:appt_app/models/app_state_model.dart';
import 'package:appt_app/widgets/utilities/animation_fade_in.dart';
import 'package:flutter/material.dart';
import 'package:appt_app/styles.dart';

class ApptAddCartItems extends StatelessWidget {
  const ApptAddCartItems({Key key, @required this.model}) : super(key: key);
  final AppStateModel model;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return AnimationFadeIn(
            child: Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: Container(
                child: Column(
                  children: <Widget>[
                    Card(
                      color: Theme.of(context).accentColor,
                      child: InkWell(
                        onTap: () {
                          model.removeServiceFromCart(model
                              .getServiceById(
                                  model.servicesInCart.keys.toList()[index])
                              .id);
                        },
                        child: ListTile(
                          dense: true,
                          leading: Container(
                            width: 58,
                            child: Text(
                              model.servicesInCart.values
                                      .toList()[index]
                                      .toString() +
                                  '    x ',
                              style: Styles.mediumWhiteText,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          title: Text(
                            model
                                .getServiceById(
                                    model.servicesInCart.keys.toList()[index])
                                .description,
                            style: Styles.mediumWhiteText,
                          ),
                          trailing: (Icon(
                            Icons.close,
                            color: Colors.white,
                          )),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
        childCount: model.servicesInCart.length,
      ),
    );
  }
}
