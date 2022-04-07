import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taniku/model/response_login_model.dart';
import 'package:taniku/model/response_regist_model.dart';
import 'package:taniku/service/api/register_api.dart';

class RegisterViewModel extends ChangeNotifier {
  final _registerApi = RegisterApi();
  Data dataRegist = new Data();

  RegisterViewModel(BuildContext) {}

  void register(String name, String mobile, String password,
      String confirm_password, BuildContext context) async {
    final response = await _registerApi.register(
        name, mobile, password, confirm_password, context);
    if (response.error == null) {
      if (response.isSuccess == true) {
        print(response.message.toString());
      } else {
        print(response.message.toString());
      }
    } else {
      print(response.error.toString());
    }
    notifyListeners();
  }
}