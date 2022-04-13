import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:taniku/model/response_kirim_model.dart';
import 'package:taniku/service/api/kirim_api.dart';

class KirimViewModel extends ChangeNotifier {
  final _kirimApi = KirimApi();
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
}