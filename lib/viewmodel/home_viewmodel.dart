import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:taniku/model/response_home_model.dart';
import 'package:taniku/service/api/home_api.dart';

class HomeViewModel extends ChangeNotifier {
  final _homeApi = HomeApi();
  List<Data> dataHome = [];

  HomeViewModel(BuildContext context) {
    getListHome(context);
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
}