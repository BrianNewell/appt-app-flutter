import 'package:appt_app/services/auth_services.dart';
import 'package:appt_app/widgets/utilities/circle_avatar_generic.dart';
import 'package:flutter/material.dart';
import 'package:appt_app/styles.dart';

class SignIn extends StatelessWidget {
  const SignIn({
    Key key,
    @required this.auth,
  }) : super(key: key);

  final AuthBase auth;

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
                    photoUrl: '',
                    displayName: 'Guest',
                    fontSize: 32,
                  ),
                ),
                Text('Guest', style: Styles.sectionTitleText),
                FlatButton(
                  child: Text(
                    'CONTINUE AS "GUEST"',
                    style: TextStyle(
                        color: Colors.red,
                        decoration: TextDecoration.underline),
                  ),
                  onPressed: auth.signInAnonymously,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 30),
              child: Text('-- or --'),
            ),
            SizedBox(
              height: 48,
              width: 240,
              child: RaisedButton(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(2.0)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset('assets/images/icons/google-logo.png'),
                    SizedBox(width: 12),
                    Text('Sign in with Google'),
                  ],
                ),
                onPressed: auth.signInWithGoogle,
              ),
            ),
            SizedBox(height: 30),
            SizedBox(
              height: 48,
              width: 240,
              child: RaisedButton(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(2)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'assets/images/icons/facebook-logo.png',
                      color: Colors.blue[900],
                    ),
                    SizedBox(width: 12),
                    Text('Sign in with Facebook'),
                  ],
                ),
                onPressed: auth.signInWithFacebook,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.info_outline,
                    size: 18,
                  ),
                  Text(' "Guest" settings will not be saved')
                ],
                //
              ),
            )
          ],
        ),
      ),
    );
  }
}
