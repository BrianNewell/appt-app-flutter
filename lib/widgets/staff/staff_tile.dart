import 'package:appt_app/models/staff_model.dart';
import 'package:flutter/material.dart';

class StaffTile extends StatelessWidget {
  final Staff staffData;

  StaffTile({Key key, @required this.staffData})
      : assert(staffData != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
      dense: true,
      leading: new StaffImage(staffData: staffData),
      title: new StaffBio(staffData: staffData),
    );
  }
}

class StaffImage extends StatelessWidget {
  const StaffImage({
    Key key,
    @required this.staffData,
  }) : super(key: key);

  final Staff staffData;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: staffData.id,
      child: CircleAvatar(
        backgroundImage: AssetImage(staffData.imageAsset),
      ),
    );
  }
}

class StaffBio extends StatelessWidget {
  const StaffBio({
    Key key,
    @required this.staffData,
  }) : super(key: key);

  final Staff staffData;

  @override
  Widget build(BuildContext context) {
    return Text(
      staffData.bio,
      overflow: TextOverflow.ellipsis,
      maxLines: 3,
    );
  }
}
