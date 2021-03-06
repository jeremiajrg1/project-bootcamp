import 'dart:async';
import 'dart:convert';
import 'dart:io';
// import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:taniku/model/response_kirim_model.dart';
import 'package:http/http.dart' as http;
import 'package:taniku/service/local/shared_pref_service.dart';

class KirimApi {
  var client = http.Client();
  var baseUrl = "http://34.126.79.39:81/";
  
  Future<KirimModel> getListKirim(BuildContext context) async {
    var uri = Uri.parse(baseUrl+"api/niaga/reservasi/getAll").replace();
    final tokenLocal = await SharedPreferenceService().getStringSharedPref("token");
    final userIdLocal = await SharedPreferenceService().getStringSharedPref("user_id");
    Map<String, String> headersToken (String token) {
      return {
        'Content-Type' : 'application/json',
        'Accept' : 'application/json',
        'Authorization' : 'Bearer $token'
      };
    }
    var _body = jsonEncode({
      "page": "1", "sort": "desc", "status": "", "type_user": "PTN", "user_id": userIdLocal
    });
    print(_body);
    try {
      final response = await client
          .post(uri, headers: headersToken(tokenLocal), body: _body)
          .timeout(const Duration(seconds: 30));
      print(response.body);
      if (response.statusCode == HttpStatus.ok) {
        return KirimModel.fromJson(jsonDecode(response.body));
      } else {
        return KirimModel.withError("Gagal Load Data");
      }
    } on TimeoutException catch (_) {
      return KirimModel.withError("Waktu habis, silahkan coba kembali");
    }
  }
}