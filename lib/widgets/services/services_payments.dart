import 'package:flutter/material.dart';

class ServicesPayments extends StatelessWidget {
  const ServicesPayments({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Image.asset('assets/images/icons/apple-pay-48.png'),
        Image.asset('assets/images/icons/visa-48.png'),
        Image.asset('assets/images/icons/mastercard-48.png'),
        Image.asset('assets/images/icons/american-express-48.png'),
      ],
    );
  }
}
