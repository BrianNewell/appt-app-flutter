import 'package:flutter/foundation.dart';

class Service {
  const Service({
    @required this.id,
    @required this.description,
    @required this.price,
    @required this.serviceMinutes,
  })  : assert(id != null),
        assert(description != null),
        assert(price != null),
        assert(serviceMinutes != null);

  final int id;
  final String description;
  final String price;
  final int serviceMinutes;
}
