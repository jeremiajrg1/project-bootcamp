class ProvinsiModel {
  bool? isSuccess;
  String? message;
  List<Data>? data;
  String? error;

  ProvinsiModel({this.isSuccess, this.message, this.data, this.error});

  factory ProvinsiModel.withError(String error) => ProvinsiModel(error: error);

  ProvinsiModel.fromJson(Map<String, dynamic> json) {
    isSuccess = json['isSuccess'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
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

class Data {
  int? provinsiId;
  String? provinsiName;

  Data({this.provinsiId, this.provinsiName});

  Data.fromJson(Map<String, dynamic> json) {
    provinsiId = json['provinsi_id'];
    provinsiName = json['provinsi_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['provinsi_id'] = this.provinsiId;
    data['provinsi_name'] = this.provinsiName;
    return data;
  }
}