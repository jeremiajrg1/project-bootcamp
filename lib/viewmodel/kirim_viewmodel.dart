import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:taniku/model/response_kirim_model.dart';
import 'package:taniku/service/api/kirim_api.dart';

import '../service/api/ReservasiUpdateApi.dart';

class KirimViewModel extends ChangeNotifier {
  final _kirimApi = KirimApi();
  final _ReservasiUpdateApi = ReservasiUpdateApi();
  List<Data> dataKirim = [];

  KirimViewModel(BuildContext context) {
    getListKirim(context);
  }

  void getListKirim(BuildContext context) async {
    final response = await _kirimApi.getListKirim(context);
    if (response.error == null) {
      if (response.isSuccess == true) {
        dataKirim = response.data!;
        print(jsonEncode(dataKirim));
      } else {
        print(response.message.toString());
      }
    } else {
      print(response.error.toString());
    }
    notifyListeners();
  }

  void getUpdateReservasi(String noRes, String pabrik_id, String tanggal, String waktu, BuildContext context) async {
    final response = await _ReservasiUpdateApi.getUpdateReservasi(noRes,pabrik_id,tanggal,waktu, context);
    if (response.error == null) {
      if(response.isSuccess == true) {
      } else {
        print(response.message.toString());
      }
    } else {
      print(response.error.toString());
    }
    notifyListeners();
  }
}