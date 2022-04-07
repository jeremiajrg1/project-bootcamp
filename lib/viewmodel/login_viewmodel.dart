import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taniku/model/response_login_model.dart';
import 'package:taniku/service/api/login_api.dart';
import 'package:taniku/view/bottom_nav.dart';
// import 'package:login_list_api/view/list_kebun_screen.dart';

import '../service/local/shared_pref_service.dart';

class LoginViewModel extends ChangeNotifier{
  final _loginApi = LoginApi();
  final _sharedPref = SharedPreferenceService();
  Data dataLogin = new Data();

  LoginViewModel(BuildContext){}

  void login(String username, String password, BuildContext context) async {
    final response = await _loginApi.login(username, password, context);
    if (response.error == null) {
      if(response.isSuccess == true) {
        dataLogin = response.data!;
        _sharedPref.setStringSharedPref("token", dataLogin.token.toString());
        _sharedPref.setStringSharedPref("petani_id", dataLogin.detail!.petaniId.toString());
        _sharedPref.setStringSharedPref("user_id", dataLogin.userId.toString());
        print(jsonEncode(dataLogin));
        Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNav()));
      } else {
        print(response.message.toString());
      }
    } else {
      print(response.error.toString());
    }
    notifyListeners();
  }

  Future<bool> loginWithReturn(String username, String password, BuildContext context) async {
    final response = await _loginApi.login(username, password, context);
    if (response.error == null) {
      if(response.isSuccess == true) {
        dataLogin = response.data!;
        _sharedPref.setStringSharedPref("token", dataLogin.token.toString());
        _sharedPref.setStringSharedPref("petani_id", dataLogin.detail!.petaniId.toString());
        _sharedPref.setStringSharedPref("user_id", dataLogin.userId.toString());
        print(jsonEncode(dataLogin));
        return true;
      } else {
        print(response.message.toString());
        return false;
      }
    } else {
      print(response.error.toString());
      return false;
    }
  }

}