class KabupatenModel {
  bool? isSuccess;
  String? message;
  List<DataKabupaten>? data;
  String? error;

  KabupatenModel({this.isSuccess, this.message, this.data, this.error});

  factory KabupatenModel.withError(String error) => KabupatenModel(error: error);

  KabupatenModel.fromJson(Map<String, dynamic> json) {
    isSuccess = json['isSuccess'];
    message = json['message'];
    if (json['data'] != null) {
      data = <DataKabupaten>[];
      json['data'].forEach((v) {
        data!.add(new DataKabupaten.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isSuccess'] = this.isSuccess;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DataKabupaten {
  int? kabupatenKotaId;
  int? provinsiId;
  String? kabupatenKotaName;

  DataKabupaten({this.kabupatenKotaId, this.provinsiId, this.kabupatenKotaName});

  DataKabupaten.fromJson(Map<String, dynamic> json) {
    kabupatenKotaId = json['kabupaten_kota_id'];
    provinsiId = json['provinsi_id'];
    kabupatenKotaName = json['kabupaten_kota_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['kabupaten_kota_id'] = this.kabupatenKotaId;
    data['provinsi_id'] = this.provinsiId;
    data['kabupaten_kota_name'] = this.kabupatenKotaName;
    return data;
  }
}