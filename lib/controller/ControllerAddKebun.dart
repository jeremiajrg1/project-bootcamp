import 'package:flutter/cupertino.dart';
import 'package:taniku/model/addKebunModel.dart';
import 'package:taniku/service/api/tambahkebun_api.dart';

class ControllerViewModel extends ChangeNotifier {
  final _tambahkebunApi = TambahKebunApi();
  AddKebunModel addKebunModel = AddKebunModel();
  List<ListDokumen1> dokumenlist = [];
  List<ListSertifikasi> sertifikatList = [];

  void addKebun (BuildContext context) async {
    final response = await _tambahkebunApi.addKebun(addKebunModel, context);
    print(response);
    notifyListeners();
  }
}