import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:taniku/model/response_home_model.dart';
import 'package:taniku/service/local/shared_pref_service.dart';
import 'package:http/http.dart' as http;

class HomeApi {
  var client = http.Client();
  var baseUrl = "http://34.126.79.39:81/";

  Future<HomeModel> getListHome(BuildContext context) async {
    var uri = Uri.parse(baseUrl + "api/niaga/news").replace();
    final tokenLocal = "N2IyN2I0N2ZmZGU3MmE4NjgxNDhjZGZlNTA4ZGFhZTY0Zjc4YmI0Yw==";
    final petaniIdLocal = await SharedPreferenceService().getStringSharedPref("petani_id");
    final userIdLocal = await SharedPreferenceService().getStringSharedPref("user_id");
    Map<String, String> headersToken(String token) {
      return {
        'Content-Type' : 'application/json',
        'Accept' : 'application/json',
        'Authorization' :'Bearer N2IyN2I0N2ZmZGU3MmE4NjgxNDhjZGZlNTA4ZGFhZTY0Zjc4YmI0Yw=='
      };
    }
    var _body = jsonEncode({
      'orderBy' : 'id',
      'petani_id' : petaniIdLocal,
      'sort' : "asc",
      'user_id' : userIdLocal,
    });
    try {
      final response = await client
          .post(uri, headers: headersToken(tokenLocal), body: _body)
          .timeout(const Duration(seconds: 30));
      print(response.body);
      if (response.statusCode == HttpStatus.ok) {
        return HomeModel.fromJson(jsonDecode(response.body));
      } else {
        return HomeModel.withError("Gagal Load Data");
      }
    } on TimeoutException catch (_) {
      return HomeModel.withError("Waktu Habis, Silahkan coba kembali");
    }
  }
}