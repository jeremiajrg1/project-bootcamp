class TipeLahanModel {
  bool? isSuccess;
  String? message;
  List<DataLahan>? data;
  String? error;

  TipeLahanModel({this.isSuccess, this.message, this.data, this.error});

  factory TipeLahanModel.withError(String error) => TipeLahanModel(error: error);

  TipeLahanModel.fromJson(Map<String, dynamic> json) {
    isSuccess = json['isSuccess'];
    message = json['message'];
    if (json['data'] != null) {
      data = <DataLahan>[];
      json['data'].forEach((v) {
        data!.add(new DataLahan.fromJson(v));
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

class DataLahan {
  int? statusLahanId;
  String? statusLahanName;

  DataLahan({this.statusLahanId, this.statusLahanName});

  DataLahan.fromJson(Map<String, dynamic> json) {
    statusLahanId = json['status_lahan_id'];
    statusLahanName = json['status_lahan_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status_lahan_id'] = this.statusLahanId;
    data['status_lahan_name'] = this.statusLahanName;
    return data;
  }
}