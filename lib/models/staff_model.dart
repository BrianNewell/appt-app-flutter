import 'package:flutter/foundation.dart';

class Staff {
  const Staff({
    @required this.id,
    @required this.name,
    @required this.bio,
    @required this.imageAsset,
    this.availableTimes,
  })  : assert(id != null),
        assert(name != null),
        assert(bio != null),
        assert(imageAsset != null);

  final int id;
  final String name;
  final String bio;
  final String imageAsset;
  final List<String> availableTimes;
}
