import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:taniku/model/response_jenisdokumen_model.dart';
import 'package:taniku/service/api/tambahkebun_api.dart';

class TambahDokumenViewModel extends ChangeNotifier {
  final _TambahDokumenApi = TambahKebunApi();
  List <Data> DataDokumen = [];

  TambahDokumenViewModel(BuildContext context) {
    getDokumen(context);
  }

  void getDokumen(BuildContext context) async {
    final response = await _TambahDokumenApi.getJenisDokumen(context);
    if (response.error == null) {
      if (response.isSuccess == true) {
        DataDokumen = response.data!;
        print(jsonEncode(DataDokumen));
      } else {
        print(response.message.toString());
      }
    } else {
      print(response.error.toString());
    }
    notifyListeners();
  }
}