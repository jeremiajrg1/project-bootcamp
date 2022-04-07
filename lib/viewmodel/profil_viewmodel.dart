import 'package:flutter/cupertino.dart';
import 'package:taniku/model/response_profil_model.dart';
import 'package:taniku/service/api/profil_api.dart';


class ProfilViewModel extends ChangeNotifier {
  final _profilApi = ProfilApi();
  Data dataProfil = new Data();

  ProfilViewModel(BuildContext context){
    getListProfil(context);
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
}