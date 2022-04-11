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

  }
}