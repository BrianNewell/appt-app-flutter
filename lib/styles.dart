import 'package:flutter/material.dart';

abstract class Styles {
  static const pageTitleText = TextStyle(
    color: Colors.black,
    fontFamily: 'PlayfairDisplay',
    fontSize: 22,
    fontWeight: FontWeight.bold,
  );

  static const sectionTitleText = TextStyle(
    color: Colors.black,
    fontFamily: 'PlayfairDisplay',
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  static const mediumText = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );
  static const mediumWhiteText = TextStyle(
    color: Colors.white,
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );

  static const apptSectionText = TextStyle(
    color: Colors.black,
    decoration: TextDecoration.underline,
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );
}
