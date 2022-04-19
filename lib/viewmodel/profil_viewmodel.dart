import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:taniku/model/response_listkebun_model.dart';
import 'package:taniku/model/response_profil_model.dart';
import 'package:taniku/service/api/profil_api.dart';
import 'package:taniku/service/api/listkebun_api.dart';


class ProfilViewModel extends ChangeNotifier {
  final _profilApi = ProfilApi();
  Data dataProfil = new Data();
  final _kebunApi = ListKebunApi();
  List<DataKebun> dataKebunProfil = [];

  ProfilViewModel(BuildContext context){
    getListProfil(context);
    getKebunProfil(context);
  }

  void getListProfil(BuildContext context) async {
    final response = await _profilApi.getListProfil(context);
    if (response.error == null) {
      if (response.isSuccess == true) {
        dataProfil = response.data!;
        print(response.message.toString());
      } else {
        print(response.message.toString());
      }
    } else {
      print(response.error.toString());
    }
    notifyListeners();
  }

  void getKebunProfil(BuildContext context) async {
    final response = await _kebunApi.getListKebun(context);
    if (response.error == null) {
      if (response.isSuccess == true) {
        dataKebunProfil = response.data!;
        print(jsonEncode(dataKebunProfil));
      } else {
        print(response.message.toString());
      }
    } else {
      print(response.error.toString());
    }
    notifyListeners();
  }
}