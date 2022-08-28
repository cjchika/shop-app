import 'dart:convert' as convert;

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

import '../models/http_exception.dart';

class Auth with ChangeNotifier {
  String _token;
  DateTime _expiryDate;
  String _userId;

  static const keyParam = {'key': 'AIzaSyBVDI4_fEAYL5Dmo2FiA-_PYCXuMauiAd8'};

  Future<void> _authenticate(
      String email, String password, String authUrl) async {
    final url = Uri.https(
        'identitytoolkit.googleapis.com', '/v1/accounts:$authUrl', keyParam);
    try {
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
      final responseData = convert.json.decode(response.body);
      if (responseData['error'] != null) {
        throw HttpException(responseData['error']['message']);
      }
    } catch (error) {
      throw error;
    }
  }

  Future<void> signup(String email, String password) async {
    return _authenticate(email, password, 'signUp');
  }

  Future<void> login(String email, String password) async {
    return _authenticate(email, password, 'signInWithPassword');
  }
}
