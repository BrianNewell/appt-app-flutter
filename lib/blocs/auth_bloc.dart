import 'dart:async';
import 'package:appt_app/platform/platform_alert_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:appt_app/services/auth_services.dart';

class AuthBloc {
  AuthBloc({@required this.auth});
  final AuthBase auth;

  final StreamController<bool> _isLoadingController = StreamController();
  Stream<bool> get isLoadingStream => _isLoadingController.stream;

  void dispose() {
    _isLoadingController.close();
  }

  void _setIsLoading(bool isLoading) => _isLoadingController.add(isLoading);

  Future<User> _signIn(Future<User> Function() signInMethod) async {
    try {
      _setIsLoading(true);
      return await signInMethod();
    } catch (e) {
      rethrow;
    } finally {
      _setIsLoading(false);
    }
  }

  Future<User> signInAnonymously() async =>
      await _signIn(auth.signInAnonymously);

  Future<User> signInWithGoogle() async => await _signIn(auth.signInWithGoogle);

  Future<User> signInWithFacebook() async =>
      await _signIn(auth.signInWithFacebook);

  Future<void> signOut() async {
    try {
      await auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> confirmSignOut(BuildContext context) async {
    final didRequestSignOut = await PlatformAlertDialog(
      title: 'Sign Out',
      content: '\nAre you sure you want to Sign Out?',
      cancelActionText: 'Cancel',
      defaultActionText: 'Sign Out',
    ).show(context);
    if (didRequestSignOut == true) {
      signOut();
    }
  }
}
