import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:taniku/model/response_transaksi_model.dart';
import 'package:taniku/service/api/transaksi_api.dart';

class TransaksiViewModel extends ChangeNotifier {
  final _TransaksiApi = TransaksiApi();
  List<Data> dataTransaksi = [];

  TransaksiViewModel(BuildContext context) {
    getTransaksi(context);
  }

  void getTransaksi(BuildContext context) async {
    final response = await _TransaksiApi.getListTransaksi(context);
    if (response.error == null) {
      if (response.isSuccess == true) {
        dataTransaksi = response.data!;
        print(jsonEncode(dataTransaksi));
      } else {
        print(response.message.toString());
      }
    } else {
      print(response.error.toString());
    }
    notifyListeners();
  }
}