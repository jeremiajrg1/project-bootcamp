import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:taniku/db.dart';
import 'package:taniku/model/response_adddokumen_model.dart';
import 'package:taniku/model/response_jenisdokumen_model.dart';
import 'package:taniku/service/api/tambahkebun_api.dart';

class TambahDokumenViewModel extends ChangeNotifier {
  final _dbLocal = myDB();
  final _TambahDokumenApi = TambahKebunApi();
  ListTambahDokumen editDokumenfirst = ListTambahDokumen();
  List <Data> DataDokumen = [];
  List<ListTambahDokumen> listDokumen = [];

  TambahDokumenViewModel(BuildContext context) {
    getDokumen(context);
    getListDoc(context);
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
  void getListDoc(BuildContext context) async {
    await _dbLocal.open();
    final response = await _dbLocal.getListDokumen(context);
    if(response.isNotEmpty) {
      listDokumen = response;
    } else {
      print("Tidak ada Data");
    }
    notifyListeners();
  }

  void addDokumen(String namaDokumen, String noDokumen, String image, BuildContext context) async {
    await _dbLocal.open();
    await _dbLocal.addDokumen(namaDokumen, noDokumen, image, context);
    notifyListeners();
  }

  void editDokumen(int id, String namaDokumen, String noDokumen, String image, BuildContext context) async {
    await _dbLocal.open();
    await _dbLocal.editDokumen(id, namaDokumen, noDokumen, image, context);
    notifyListeners();
  }

  void deleteDokumen(int id, BuildContext context) async{
    await _dbLocal.open();
    await _dbLocal.deleteDokumen(id, context);
    notifyListeners();
  }
}