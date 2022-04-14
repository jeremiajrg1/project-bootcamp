import 'package:flutter/cupertino.dart';
import 'package:taniku/service/api/kirimpersediaan_api.dart';

class KirimPersediaanViewModel extends ChangeNotifier {
  final _kirimPersedian = PersediaanApi();

  KirimPersediaanViewModel(BuildContext) {}

  void kirimPersediaan(String pabrikId, String nama, String tanggal, String waktu, String tonasi,
      BuildContext context) async {
    final response = await _kirimPersedian.kirimPersediaan(pabrikId, nama, tanggal, waktu, tonasi, context);
    if (response.error == null) {
      if (response.isSuccess == true) {
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