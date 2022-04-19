import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:taniku/model/response_kabupaten_model.dart';
import 'package:taniku/model/response_kelurahan_model.dart';
import 'package:taniku/model/response_provinsi_model.dart';
import 'package:taniku/service/api/tambahkebun_api.dart';

import '../model/response_kecamatan_model.dart';

class TambahKebunViewModel extends ChangeNotifier {
  final _TambahKebunApi = TambahKebunApi();
  List<Data> dataProvinsi = [];
  List<DataKabupaten> dataKabupaten = [];
  List<DataKecamatan> dataKecamatan = [];
  List<DataKelurahan> dataKelurahan = [];

  TambahKebunViewModel(BuildContext context) {
    getProvinsi(context);
  }
  void getProvinsi(BuildContext context) async {
    final response = await _TambahKebunApi.getProvinsi(context);
    if (response.error == null) {
      if (response.isSuccess == true) {
        dataProvinsi = response.data!;
        print(jsonEncode(dataProvinsi));
      } else {
        print(response.message.toString());
      }
    } else {
      print(response.error.toString());
    }
    notifyListeners();
  }

  void getKabupaten(String provinsiId, BuildContext context) async {
    final response = await _TambahKebunApi.getKabupaten(provinsiId, context);
    if (response.error == null) {
      if (response.isSuccess == true) {
        dataKabupaten = response.data!;
        print(jsonEncode(dataKabupaten));
      } else {
        print(response.message.toString());
      }
    } else {
      print(response.error.toString());
    }
    notifyListeners();
  }

  void getKecamatan(String kabupatenId, BuildContext context) async {
    final response = await _TambahKebunApi.getKecamatan(kabupatenId, context);
    if (response.error == null) {
      if (response.isSuccess == true) {
        dataKecamatan = response.data!;
        print(jsonEncode(dataKecamatan));
      } else {
        print(response.message.toString());
      }
    } else {
      print(response.error.toString());
    }
    notifyListeners();
  }

  void getKelurahan(String kecamatanId, BuildContext context) async {
    final response = await _TambahKebunApi.getKelurahan(kecamatanId, context);
    if (response.error == null) {
      if (response.isSuccess == true) {
        dataKelurahan = response.data!;
        print(jsonEncode(dataKelurahan));
      } else {
        print(response.message.toString());
      }
    } else {
      print(response.error.toString());
    }
    notifyListeners();
  }
}