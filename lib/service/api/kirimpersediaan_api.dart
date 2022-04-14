import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:taniku/model/response_kirimpersediaan_model.dart';
import 'package:http/http.dart' as http;

class PersediaanApi {
  var client = http.Client();
  var baseUrl = "http://34.126.79.39:81/";

  Future<KirimPersediaanModel> kirimPersediaan(String pabrikId, String nama, String tanggal, String waktu, String tonasi, BuildContext context) async {
    var uri = Uri.parse(baseUrl + "api/niaga/reservasi/add").replace();
    final tokenLocal = "N2IyN2I0N2ZmZGU3MmE4NjgxNDhjZGZlNTA4ZGFhZTY0Zjc4YmI0Yw==";
    Map<String, String> headersToken(String token) {
      return {
        'Content-Type' : 'application/json',
        'Accept' : 'application/json',
        'Authorization' : 'Bearer $token'
      };
    }
    var _body = jsonEncode({
      "koperasi_id": "", "pabrik_id": "8", "petani_id": "46", "tanggal_pengiriman": "2022-03-16 17:46:00", "tonasi": "1000", "user_id": "85"
    });
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