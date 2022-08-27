import 'dart:convert' as convert;

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class Auth with ChangeNotifier {
  String _token;
  DateTime _expiryDate;
  String _userId;

  Future<void> signup(String email, String password) async {
    final url = Uri.http(
      'identitytoolkit.googleapis.com',
      '/v1/accounts:signUp?key=AIzaSyBVDI4_fEAYL5Dmo2FiA-_PYCXuMauiAd8',
    );
    final response = await http.post(
      url,
      body: convert.json.encode(
        {
          'email': email,
          'password': password,
          'returnSecureToken': true,
        },
      ),
    );
    print(convert.json.encode(response.body));
  }
}
