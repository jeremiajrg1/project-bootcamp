import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:taniku/model/response_detail_model.dart';
import 'package:taniku/service/local/shared_pref_service.dart';
import 'package:http/http.dart' as http;

import '../../model/response_listdokumen_model.dart';

class DetailApi {
  var client = http.Client();
  var baseUrl = "http://34.126.79.39:81/";
  
  Future<ListDetailModel> getListDetail(BuildContext context, String kebun_id) async {
    var uri = Uri.parse(baseUrl + "api/niaga/kebun/findOneKebun").replace();
    final tokenLocal = "MjZhYWNiMDE4YzlmYmFmYmIxMjgzNzgyZGFiMTM2NzVlOTQ0MTVkNQ==";
    // final userIdLocal = "85";
    // final petaniIdLocal = "46";
    Map<String, String> headersToken(String token) {
      return {
        'Content-Type' : 'application/json',
        'Accept' : 'application/json',
        'Authorization' : 'Bearer $tokenLocal'
      };
    }
    var _body = jsonEncode({
      'user_id' : "85",
      'kebun_id' : kebun_id,
    });
    try {
      final response = await client
          .post(uri, headers: headersToken(tokenLocal), body: _body)
          .timeout(const Duration(seconds: 30));
      print(response.body);
      if (response.statusCode == HttpStatus.ok) {
        return ListDetailModel.fromJson(jsonDecode(response.body));
      } else {
        return ListDetailModel.withError("Gagal Load Data");
      }
    } on TimeoutException catch (_) {
      return ListDetailModel.withError("Waktu habis, silahkan coba kembali");
    }
  }
  
  Future<ListDokumen> getListDokumen(BuildContext context, String kebun_id) async {
    var uri = Uri.parse(baseUrl + "api/niaga/kebun/getKebunSertifikat").replace();
    final tokenLocal = "MjZhYWNiMDE4YzlmYmFmYmIxMjgzNzgyZGFiMTM2NzVlOTQ0MTVkNQ==";
    Map<String, String> headersToken(String token) {
      return {
        'Content-Type' : 'application/json',
        'Accept' : 'application/json',
        'Authorization' : 'Bearer $token'
      };
    }
    var _body = jsonEncode({
      'orderBy' : 'nomor',
      'sort' : 'asc',
      'user_id' : '85',
      'kebun_id' : kebun_id
    });
    print(_body);
    try{
      final response = await client
          .post(uri, headers: headersToken(tokenLocal), body: _body)
          .timeout(const Duration(seconds: 30));
      print(response.body);
      if (response.statusCode == HttpStatus.ok) {
        return ListDokumen.fromJson(json)
      }
    }
  }
}