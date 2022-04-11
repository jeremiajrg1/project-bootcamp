import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:taniku/model/response_home_model.dart';
import 'package:taniku/model/response_listkebun_model.dart';
import 'package:taniku/service/api/listkebun_api.dart';
import 'package:taniku/service/api/home_api.dart';

class HomeViewModel extends ChangeNotifier {
  final _homeApi = HomeApi();
  List<Data> dataHome = [];
  final _listKebunApi = ListKebunApi();
  List<DataKebun> dataKebun = [];

  HomeViewModel(BuildContext context) {
    getListHome(context);
    getListKebun(context);
  }

  void getListHome(BuildContext context) async {
    final response = await _homeApi.getListHome(context);
    if (response.error == null) {
      if (response.isSuccess == true) {
        dataHome = response.data!;
        print(jsonEncode(dataHome));
      } else {
        print(response.message.toString());
      }
    } else {
      print(response.error.toString());
    }
    notifyListeners();
  }
  void getListKebun(BuildContext context) async {
    final response = await _listKebunApi.getListKebun(context);
    if (response.error == null) {
      if (response.isSuccess == true){
        dataKebun = response.data!;
        print(jsonEncode(dataKebun));
      } else {
        print(response.message.toString());
      }
    } else {
      print(response.error.toString());
    }
    notifyListeners();
  }
}