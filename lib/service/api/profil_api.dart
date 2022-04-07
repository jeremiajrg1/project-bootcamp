import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:taniku/model/response_profil_model.dart';
import 'package:http/http.dart' as http;
import 'package:taniku/service/local/shared_pref_service.dart';

class ProfilApi {
  var client = http.Client();
  var baseUrl = "http://34.126.79.39:81/";
  
  Future<ProfilModel> getListProfil(BuildContext context) async {
    var uri = Uri.parse(baseUrl + "api/niaga/profile/getProfile").replace();
    final tokenLocal = await SharedPreferenceService().getStringSharedPref("token");
    final userIdLocal = await SharedPreferenceService().getStringSharedPref("user_id");
    Map<String, String> headersToken(String token){
      return {
        'Content-Type' : 'application/json',
        'Accept' : 'application/json',
        'Authorization' : 'Bearer $token'
      };
    }
    var _body = jsonEncode({
      'user_id' : userIdLocal
    });
    // print(tokenLocal);
    print(_body);
    try{
      final response = await client
          .post(uri, headers: headersToken(tokenLocal), body: _body)
          .timeout(const Duration(seconds: 30));
      print(response.body);
      if (response.statusCode == HttpStatus.ok) {
        return ProfilModel.fromJson(jsonDecode(response.body));
      } else {
        return ProfilModel.withError("Gagal Load Data");
      }
    } on TimeoutException catch (_) {
      return ProfilModel.withError("Waktu habis, Silahkan coba kembali");
    }
  }
}