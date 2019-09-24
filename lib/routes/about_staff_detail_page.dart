import 'package:appt_app/models/staff_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shimmer/shimmer.dart';
import 'package:appt_app/styles.dart';

class AboutPageStaffDetailPage extends StatefulWidget {
  final Staff staffData;

  AboutPageStaffDetailPage({Key key, @required this.staffData})
      : assert(staffData != null),
        super(key: key);

  @override
  _AboutPageStaffDetailPageState createState() =>
      _AboutPageStaffDetailPageState();
}

class _AboutPageStaffDetailPageState extends State<AboutPageStaffDetailPage> {
  @override
  initState() {
    // Hide status bar
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
  }

  @override
  void dispose() {
    // Restore status bar
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.close),
        backgroundColor: Theme.of(context).accentColor,
        foregroundColor: Colors.white,
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      body: InkWell(
        child: Column(
          children: <Widget>[
            Hero(
              tag: widget.staffData.id,
              child: Image.asset(widget.staffData.imageAsset),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: SizedBox(
                child: Shimmer.fromColors(
                  baseColor: Colors.grey[700],
                  highlightColor: Colors.red,
                  period: Duration(milliseconds: 3000),
                  child: Text(
                    widget.staffData.name,
                    textAlign: TextAlign.center,
                    style: Styles.pageTitleText,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Text(widget.staffData.bio),
            ),
          ],
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
