import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:taniku/model/response_regist_model.dart';

class RegisterApi {
  var client = http.Client();
  var baseUrlregist = "http://34.126.79.39:81/";

  Future<registerModel> register(String name, String mobile, String password, String confirm_password, BuildContext context) async {
    var uri = Uri.parse(baseUrlregist + "api/niaga/auth/register");
    Map<String, String> headers() {
      return {'Content-Type' : 'application/json', 'Accept' : 'application/json'};
  }
  var _body = jsonEncode({
    'type_user' : 'PTN',
    'name' : name,
    'mobile' : mobile,
    'password' : password,
    'confirm_password' : confirm_password
  });
    try {
      final response = await client
          .post(uri, headers: headers(), body: _body)
          .timeout(const Duration(seconds: 30));
      if (response.statusCode == HttpStatus.ok) {
        return registerModel.fromJson(jsonDecode(response.body));
      } else {
        return registerModel.withError("Gagal load data");
      }
    } on TimeoutException catch (_) {
      return registerModel.withError("waktu habis, silahkan coba kembali");
    }
  }
}