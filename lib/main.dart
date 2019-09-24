import 'package:appt_app/models/app_state_model.dart';
import 'package:appt_app/routes/user_profile_page.dart';
import 'package:appt_app/widgets/utilities/circle_avatar_generic.dart';
import 'package:appt_app/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'package:appt_app/routes/landing_page.dart';
import 'package:appt_app/routes/services_page.dart';
import 'package:appt_app/routes/about_page.dart';
import 'package:appt_app/routes/contact_page.dart';
import 'package:appt_app/routes/appt_add_page.dart';

import 'package:appt_app/services/auth_services.dart';
import 'package:appt_app/blocs/auth_bloc.dart';

void main() async {
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = Auth();
    final authBloc = AuthBloc(auth: auth);
    return MultiProvider(
      providers: [
        Provider<AuthBase>.value(value: auth),
        Provider<AuthBloc>.value(value: authBloc),
        ChangeNotifierProvider<AppStateModel>(
          builder: (context) => AppStateModel()..loadAppData(),
        ),
      ],
      child: MaterialApp(
        title: 'Appt App',
        theme: new ThemeData(
          primaryColor: Colors.white,
          accentColor: Colors.red[800],
          splashColor: Colors.red,
        ),
        home: AppScaffold(),
      ),
    );
  }
}

class AppScaffold extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AppScaffoldState();
  }
}

class _AppScaffoldState extends State<AppScaffold> {
  int _currentNavPage = 0;

  final List<Widget> _allNavPages = [
    LandingPage(),
    ServicesPage(),
    AboutPage(),
    ContactPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthBase>(context);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          centerTitle: false,
          elevation: 1,
          title: Text(
            'Best Barbers & Salon',
            style: Styles.pageTitleText,
          ),
          actions: <Widget>[
            StreamBuilder<User>(
              stream: auth.onAuthStateChanged,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.active) {
                  User user = snapshot.data;
                  if (user == null) {
                    return new CircleAvatarAppBar(
                      photoUrl: '',
                      displayName: 'Guest',
                    );
                  } else {
                    return new CircleAvatarAppBar(
                      photoUrl: user.photoUrl,
                      displayName: user.displayName,
                    );
                  }
                } else {
                  return new CircleAvatarAppBar(photoUrl: '');
                }
              },
            ),
          ],
        ),
      ),
      body: _allNavPages[_currentNavPage],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentNavPage,
        backgroundColor: Colors.grey[200],
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        onTap: onBottomNavTap,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.content_cut),
            title: Text('Service'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            title: Text('About'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.help_outline),
            title: Text('Contact'),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).accentColor,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => ApptAdd()));
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void onBottomNavTap(int index) {
    setState(() {
      _currentNavPage = index;
    });
  }
}

class CircleAvatarAppBar extends StatelessWidget {
  const CircleAvatarAppBar(
      {Key key, @required this.photoUrl, this.displayName = ''})
      : super(key: key);
  final String photoUrl;
  final String displayName;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => UserProfilePage()));
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 16),
        child: CircleAvatarGeneric(
          photoUrl: photoUrl,
          displayName: displayName,
          radius: 30,
          fontSize: 28,
        ),
      ),
    );
  }
}
