import 'package:appt_app/blocs/auth_bloc.dart';
import 'package:appt_app/services/auth_services.dart';
import 'package:appt_app/widgets/utilities/circle_avatar_generic.dart';
import 'package:appt_app/widgets/utilities/sign_in.dart';
import 'package:appt_app/widgets/user/user_history.dart';
import 'package:appt_app/widgets/user/user_pending_appts.dart';
import 'package:appt_app/widgets/user/user_reminders.dart';
import 'package:appt_app/styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthBase>(context);
    final authBloc = Provider.of<AuthBloc>(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        centerTitle: false,
        title: Text(
          'User Profile',
          style: Styles.pageTitleText,
        ),
        elevation: 1,
      ),
      body: StreamBuilder<User>(
        stream: auth.onAuthStateChanged,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            User user = snapshot.data;
            if (user == null) {
              return SignIn(auth: auth);
            } else {
              return UserLoggedIn(user: user, authBloc: authBloc);
            }
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

class UserLoggedIn extends StatelessWidget {
  const UserLoggedIn({
    Key key,
    @required this.user,
    @required this.authBloc,
  }) : super(key: key);

  final User user;
  final AuthBloc authBloc;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[100],
      child: Center(
        child: Column(
          children: <Widget>[
            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 20),
                  child: new CircleAvatarGeneric(
                    photoUrl: user.photoUrl,
                    displayName: user.displayName,
                    fontSize: 32,
                  ),
                ),
                Text(
                  '${user.displayName}',
                  style: Styles.sectionTitleText,
                ),
                FlatButton(
                  child: Text(
                    'SIGN OUT',
                    style: TextStyle(
                        color: Colors.red,
                        decoration: TextDecoration.underline),
                  ),
                  onPressed: () => authBloc.confirmSignOut(context),
                ),
              ],
            ),
            new UserPendingAppts(),
            SizedBox(height: 10.0),
            new UserHistory(),
            SizedBox(height: 20.0),
            new UserReminders(),
          ],
        ),
      ),
    );
  }
}
