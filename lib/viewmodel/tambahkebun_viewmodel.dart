import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:taniku/model/response_jenisbibit_model.dart';
import 'package:taniku/model/response_tipelahan_model.dart';

import 'package:taniku/service/api/tambahkebun_api.dart';


class TambahKebunViewModel extends ChangeNotifier {
  final _AddKebun = TambahKebunApi();
  List<Data> DataBibit = [];
  List<DataLahan> DataLahanku = [];

  TambahKebunViewModel(BuildContext context)  {
    getTambahKebun(context);
    getTambahLahan(context);
  }
  void getTambahKebun(BuildContext context) async {
    final response = await _AddKebun.getJenisBibit(context);
    if (response.error == null) {
      if (response.isSuccess == true) {
        DataBibit = response.data!;
        print(jsonEncode(DataBibit));
      } else {
        print(response.message.toString());
      }
    } else {
      print(response.error.toString());
    }
    notifyListeners();
  }
  void getTambahLahan(BuildContext context) async {
    final response = await _AddKebun.getTipeLahan(context);
    if (response.error == null) {
      if (response.isSuccess == true) {
        DataLahanku = response.data!;
        print(jsonEncode(DataLahanku));
      } else {
        print(response.message.toString());
      }
    } else {
      print(response.error.toString());
    }
    notifyListeners();
  }
}