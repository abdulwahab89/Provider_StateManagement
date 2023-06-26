import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class LoginProvider with ChangeNotifier {
  bool _loading = false;
  get loading => _loading;
  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  void login(email, pass) async {
    try {
      Response response =
          await post(Uri.parse('https://reqres.in/api/login'), body: {
        'email': email,
        'password': pass,
      });
      if (response.statusCode == 200) {
        setLoading(false);
        print('sucesfull');
      } else {
        print('failed');
        setLoading(true);
      }
    } catch (e) {}
  }
}
