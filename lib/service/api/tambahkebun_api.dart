
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:taniku/model/response_jenisbibit_model.dart';
import 'package:taniku/model/response_jenisdokumen_model.dart';
import 'package:taniku/model/response_kabupaten_model.dart';
import 'package:taniku/model/response_kecamatan_model.dart';
import 'package:taniku/model/response_kelurahan_model.dart';
import 'package:taniku/model/response_provinsi_model.dart';
import 'package:taniku/model/response_tambahsertifikasi_model.dart';
import 'package:taniku/model/response_tipelahan_model.dart';
import 'package:taniku/service/local/shared_pref_service.dart';

class TambahKebunApi {
  var client = http.Client();
  var baseUrl = "http://34.126.79.39:81/";
  
  Future<ProvinsiModel> getProvinsi(BuildContext context) async {
    var uri = Uri.parse(baseUrl+ "api/niaga/wilayah/provinsi").replace();
    final tokenLocal = await SharedPreferenceService().getStringSharedPref("token");
    Map<String, String> headersToken(String token) {
      return {
        'Content-Type' : 'application/json',
        'Accept' : 'application/json',
        'Authorization' : 'Bearer $token'
      };
    }
    var _body = jsonEncode({});
    try {
      final response = await client
          .post(uri, headers: headersToken(tokenLocal), body: _body)
          .timeout(const Duration(seconds: 30));
      print(response.body);
      if (response.statusCode == HttpStatus.ok) {
        return ProvinsiModel.fromJson(jsonDecode(response.body));
      } else {
        return ProvinsiModel.withError("Gagal Load Data");
      }
    } on TimeoutException catch (_) {
      return ProvinsiModel.withError("waktu habis, silahkan coba kembali");
    }
  }
  
  Future<KabupatenModel> getKabupaten(String provinsiId, BuildContext context) async {
    var uri = Uri.parse(baseUrl + "api/niaga/wilayah/kabupatenKota").replace();
    final tokenLocal = await SharedPreferenceService().getStringSharedPref("token");
    Map<String, String> headersToken(String token) {
      return {
        'Content-Type' : 'application/json',
        'Accept' : 'application/json',
        'Authorization' : 'Bearer $token'
      };
    }
    var _body = jsonEncode({
      'provinsi_id' : provinsiId,
    });
    try {
      final response = await client
          .post(uri, headers: headersToken(tokenLocal), body: _body)
          .timeout(const Duration(seconds: 30));
      print(response.body);
      if (response.statusCode == HttpStatus.ok) {
        return KabupatenModel.fromJson(jsonDecode(response.body));
      } else {
        return KabupatenModel.withError("Gagal load data");
      }
    } on TimeoutException catch (_) {
      return KabupatenModel.withError("Waktu habis, silahkan coba kembali");
    }
  }
  
  Future<KecamatanModel> getKecamatan(String kabupatenId, BuildContext context) async {
    var uri = Uri.parse(baseUrl + "api/niaga/wilayah/kecamatan").replace();
    final tokenLocal = await SharedPreferenceService().getStringSharedPref("token");
    Map<String, String> headersToken(String token) {
      return {
        'Content-Type' : 'application/json',
        'Accept' : 'application/json',
        'Authorization' : 'Bearer $token'
      };
    }
    var _body = jsonEncode({
      'kabupaten_kota_id' : kabupatenId
    });
    try {
      final response = await client
          .post(uri, headers: headersToken(tokenLocal), body: _body)
          .timeout(const Duration(seconds: 30));
      print(response.body);
      if (response.statusCode == HttpStatus.ok) {
        return KecamatanModel.fromJson(jsonDecode(response.body));
      } else {
        return KecamatanModel.withError("gagal load data");
      }
    } on TimeoutException catch (_) {
      return KecamatanModel.withError("waktu habis, silahkan coba kembali");
    }
  }

  Future<KelurahanModel> getKelurahan(String kecamatanId, BuildContext context) async {
    var uri = Uri.parse(baseUrl + "api/niaga/wilayah/kelurahanDesa").replace();
    final tokenLocal = await SharedPreferenceService().getStringSharedPref("token");
    Map<String, String> headersToken (String token) {
      return {
        'Content-Type' : 'application/json',
        'Accept' : 'application/json',
        'Authorization' : 'application/json',
      };
    }
    var _body = jsonEncode({
      'kecamatan_id' : kecamatanId
    });
    try {
      final response = await client
          .post(uri, headers: headersToken(tokenLocal), body: _body)
          .timeout(const Duration(seconds: 30));
      print(response.body);
      if (response.statusCode == HttpStatus.ok) {
        return KelurahanModel.fromJson(jsonDecode(response.body));
      } else {
        return KelurahanModel.withError("Gagal load data");
      }
    } on TimeoutException catch (_) {
      return KelurahanModel.withError("waktu habis, silahkan coba kembali");
    }
  }

  Future<JenisBibitModel> getJenisBibit(BuildContext context) async {
    var uri = Uri.parse(baseUrl + "api/niaga/listJenisBibit").replace();
    try {
      final response = await client
          .get(uri, headers: {})
          .timeout(const Duration(seconds: 30));
      if (response.statusCode == HttpStatus.ok) {
        print(jsonDecode(response.body));
        return JenisBibitModel.fromJson(jsonDecode(response.body));
      } else {
        return JenisBibitModel.withError("Gagal load data");
      }
    } on TimeoutException catch (_) {
      return JenisBibitModel.withError("Waktu habis, silahkan coba kembali");
    }
  }
  
  Future<TipeLahanModel> getTipeLahan(BuildContext context) async {
    var uri = Uri.parse(baseUrl+ "api/niaga/listStatusLahan").replace();
    try{
      final response = await client
          .get(uri, headers: {})
          .timeout(const Duration(seconds: 30));
      if (response.statusCode == HttpStatus.ok) {
        print(jsonDecode(response.body));
        return TipeLahanModel.fromJson(jsonDecode(response.body));
      } else {
        return TipeLahanModel.withError("Gagal load data");
      }
    } on TimeoutException catch (_) {
      return TipeLahanModel.withError("waktu habis, silahkan coba kembali");
    }
  }

  Future<JenisDokumenModel> getJenisDokumen(BuildContext context) async {
    var uri = Uri.parse(baseUrl+"api/niaga/listJenisDokumen").replace();
    try{
      final response = await client
          .get(uri, headers: {})
          .timeout(const Duration(seconds: 30));
      if (response.statusCode == HttpStatus.ok) {
        print(jsonDecode(response.body));
        return JenisDokumenModel.fromJson(jsonDecode(response.body));
      } else {
        return JenisDokumenModel.withError("gagal load data");
      }
    } on TimeoutException catch (_) {
      return JenisDokumenModel.withError("waktu habis, silahkan coba kembali");
    }
  }
  
  Future<TambahSertifikasiModel> getTambahSertifikat(BuildContext context) async {
    var uri = Uri.parse(baseUrl + "api/niaga/listSertifikasi").replace();
    try{
      final response = await client
          .get(uri, headers: {})
          .timeout(const Duration(seconds: 30));
      if (response.statusCode == HttpStatus.ok) {
        print(jsonDecode(response.body));
        return TambahSertifikasiModel.fromJson(jsonDecode(response.body));
      } else {
        return TambahSertifikasiModel.withError("gagal load data");
      }
    } on TimeoutException catch (_) {
      return TambahSertifikasiModel.withError("waktu habis, silahkan coba kembali");
    }
  }
}