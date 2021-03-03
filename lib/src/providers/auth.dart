import 'package:flutter/material.dart';

import '../models/login_data.dart';

enum AuthMode { Login }

/// The result is an error message, callback successes if message is null
typedef AuthCallback = Future<String> Function(LoginData);

/// The result is an error message, callback successes if message is null
typedef RecoverCallback = Future<String> Function(String);

class Auth with ChangeNotifier {
  Auth({
    this.onLogin,
    this.onRecoverPassword,
    String email = '',
    String password = '',
    String confirmPassword = '',
  })  : this._email = email,
        this._password = password;

  final AuthCallback onLogin;
  final RecoverCallback onRecoverPassword;

  AuthMode _mode = AuthMode.Login;

  AuthMode get mode => _mode;
  set mode(AuthMode value) {
    _mode = value;
    notifyListeners();
  }

  bool get isLogin => _mode == AuthMode.Login;
  bool isRecover = false;

  AuthMode opposite() {
    return _mode = AuthMode.Login;
  }

  String _email = '';
  get email => _email;
  set email(String email) {
    _email = email;
    notifyListeners();
  }

  String _password = '';
  get password => _password;
  set password(String password) {
    _password = password;
    notifyListeners();
  }
}
