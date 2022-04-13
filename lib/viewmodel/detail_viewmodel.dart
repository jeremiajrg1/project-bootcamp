import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:taniku/model/response_listdokumen_model.dart';
import 'package:taniku/service/api/detail_api.dart';

import '../model/response_detail_model.dart';
import '../model/response_listsertifikat_model.dart';


class DetailViewModel extends ChangeNotifier{
  final _detailApi = DetailApi();
  List<Data> dataDetailKebun = [];
  List<Dokumen> dataDokumen = [];
  List<Sertifikat> dataSertifikat = [];

  DetailViewModel(BuildContext context, String kebun_id) {
    getListDetail(context, kebun_id);
    getListDokumen(context, kebun_id);
    getListSertifikat(context, kebun_id);
  }
  void getListDetail(BuildContext context, String kebun_id) async {
    final response = await _detailApi.getListDetail(context, kebun_id);
    if (response.error == null) {
      if (response.isSuccess == true) {
        dataDetailKebun = response.data!;
        print(jsonEncode(dataDetailKebun));
      } else {
        print(response.message.toString());
      }
    } else {
      print(response.error.toString());
    }
    notifyListeners();
  }

  void getListDokumen(BuildContext context, String kebun_id) async {
    final response = await _detailApi.getListDokumen(context, kebun_id);
    if (response.error == null) {
      if (response.isSuccess == true) {
        dataDokumen = response.data!;
        print(jsonEncode(dataDokumen));
      } else {
        print(response.message.toString());
      }
    } else {
      print(response.error.toString());
    }
    notifyListeners();
  }

  void getListSertifikat(BuildContext context, String kebun_id) async {
    final response = await _detailApi.getListSertifikat(context, kebun_id);
    if (response.error == null) {
      if (response.isSuccess == true) {
        dataSertifikat = response.data!;
        print(jsonEncode(dataSertifikat));
      } else {
        print(response.message.toString());
      }
    } else {
      print(response.error.toString());
    }
    notifyListeners();
  }
}