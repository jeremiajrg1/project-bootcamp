import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:taniku/model/response_kirimpersediaan_model.dart';
import 'package:http/http.dart' as http;
import 'package:taniku/service/local/shared_pref_service.dart';

class PersediaanApi {
  var client = http.Client();
  var baseUrl = "http://34.126.79.39:81/";

  Future<KirimPersediaanModel> kirimPersediaan(String pabrikId, String nama, String tanggal, String waktu, String tonasi, BuildContext context) async {
    var uri = Uri.parse(baseUrl + "api/niaga/reservasi/add").replace();
    final tokenLocal = await SharedPreferenceService().getStringSharedPref("token");
    final petaniIdLocal = await SharedPreferenceService().getStringSharedPref("petani_id");
    final userIdLocal = await SharedPreferenceService().getStringSharedPref("user_id");
    Map<String, String> headersToken(String token) {
      return {
        'Content-Type' : 'application/json',
        'Accept' : 'application/json',
        'Authorization' : 'Bearer $token'
      };
    }
    var _body = jsonEncode({
      "koperasi_id": "", "pabrik_id": pabrikId, "petani_id": petaniIdLocal, "tanggal_pengiriman": tanggal +" "+ waktu, "tonasi": tonasi, "user_id": userIdLocal
    });
    print(_body);
    try {
      final response = await client
          .post(uri, headers: headersToken(tokenLocal), body: _body)
          .timeout(const Duration(seconds: 30));
      print(response.body);
      if (response.statusCode == HttpStatus.ok) {
        return KirimPersediaanModel.fromJson(jsonDecode(response.body));
      } else {
        return KirimPersediaanModel.withError("Gagal load data");
      }
    } on TimeoutException catch (_) {
      return KirimPersediaanModel.withError("Waktu habis, silahkan coba kembali");
    }
  }
  
}