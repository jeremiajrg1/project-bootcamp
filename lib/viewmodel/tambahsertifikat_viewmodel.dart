import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taniku/db.dart';
import 'package:taniku/model/response_addsertifikat_model.dart';
import 'package:taniku/model/response_tambahsertifikasi_model.dart';
import 'package:taniku/service/api/tambahkebun_api.dart';

class TambahSertifikatViewModel extends ChangeNotifier {
  final _dbLocal = myDB();
  final _AddSertif = TambahKebunApi();
  ListTambahSertif editSertifi = ListTambahSertif();
  List<Data> DataSertif = [];
  List<ListTambahSertif> listSertif = [];

  TambahSertifikatViewModel(BuildContext context) {
    getTambahSertifikat(context);
    getListSertifi(context);
  }

  void getTambahSertifikat(BuildContext context) async {
    final response = await _AddSertif.getTambahSertifikat(context);
    if(response.error == null) {
      if(response.isSuccess == true) {
        DataSertif = response.data!;
        print(jsonEncode(DataSertif));
      } else {
        print(response.message.toString());
      }
    } else {
      print(response.error.toString());
    }
    notifyListeners();
  }
  void getListSertifi(BuildContext context) async {
    await _dbLocal.open();
    final response = await _dbLocal.getListSetif(context);
    if(response.isNotEmpty) {
      listSertif = response;
    } else {
      print("Tidak ada data");
    }
    notifyListeners();
  }
  void addSertif(String namaSertif, String noSertif, String dateController, String dateController2, String image, BuildContext context) async {
    await _dbLocal.open();
    await _dbLocal.addSertif(namaSertif, noSertif, dateController, dateController2, image, context);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Berhasil Tambah Data")));
    notifyListeners();
  }
  void editSertif(int id, String namaSertif, String noSertif, String dateController, String dateController2, String image, BuildContext context) async {
    await _dbLocal.open();
    await _dbLocal.editSertif(id, namaSertif, noSertif, dateController, dateController2, image, context);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Berhasil edit data")));
    notifyListeners();
  }
  void deleteSertif(int id, BuildContext context) async {
    await _dbLocal.open();
    await _dbLocal.deleteSertif(id, context);
    getListSertifi(context);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Berhasil hapus data")));
    notifyListeners();
  }
}