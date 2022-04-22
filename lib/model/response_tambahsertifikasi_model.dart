class TambahSertifikasiModel {
  bool? isSuccess;
  String? message;
  List<Data>? data;
  String? error;

  TambahSertifikasiModel({this.isSuccess, this.message, this.data, this.error});

  factory TambahSertifikasiModel.withError(String error) => TambahSertifikasiModel(error: error);

  TambahSertifikasiModel.fromJson(Map<String, dynamic> json) {
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
  int? sertifikasiId;
  String? sertifikasiName;

  Data({this.sertifikasiId, this.sertifikasiName});

  Data.fromJson(Map<String, dynamic> json) {
    sertifikasiId = json['sertifikasi_id'];
    sertifikasiName = json['sertifikasi_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sertifikasi_id'] = this.sertifikasiId;
    data['sertifikasi_name'] = this.sertifikasiName;
    return data;
  }
}