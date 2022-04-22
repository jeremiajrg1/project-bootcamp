import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:taniku/model/response_tambahsertifikasi_model.dart';
import 'package:taniku/service/api/tambahkebun_api.dart';

class TambahSertifikatViewModel extends ChangeNotifier {
  final _AddSertif = TambahKebunApi();
  List<Data> DataSertif = [];

  TambahSertifikatViewModel(BuildContext context) {
    getTambahSertifikat(context);
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
}