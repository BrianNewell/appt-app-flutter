import 'package:flutter/material.dart';

class CircleAvatarGeneric extends StatelessWidget {
  const CircleAvatarGeneric(
      {Key key,
      @required this.photoUrl,
      this.displayName = '',
      this.radius = 48.0,
      this.fontSize})
      : super(key: key);
  final String photoUrl;
  final String displayName;
  final double radius;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    if (photoUrl == '') {
      String userInitial = displayName.trim() == ''
          ? ''
          : displayName.trim().toUpperCase().substring(0, 1);
      return CircleAvatar(
        child: Text(userInitial, style: TextStyle(fontSize: fontSize)),
        radius: radius,
        foregroundColor: Colors.white,
      );
    }
    return CircleAvatar(
      radius: radius,
      backgroundImage: NetworkImage(photoUrl),
      backgroundColor: Colors.blueGrey[200],
    );
  }
}
