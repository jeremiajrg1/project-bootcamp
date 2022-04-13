class ListSertifikat {
  bool? isSuccess;
  String? message;
  List<Sertifikat>? data;
  String? error;

  ListSertifikat({this.isSuccess, this.message, this.data, this.error});

  factory ListSertifikat.withError(String error) => ListSertifikat(error: error);

  ListSertifikat.fromJson(Map<String, dynamic> json) {
    isSuccess = json['isSuccess'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Sertifikat>[];
      json['data'].forEach((v) {
        data!.add(new Sertifikat.fromJson(v));
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

class Sertifikat {
  int? id;
  int? kebunId;
  int? sertifikasiId;
  String? sertifikasiName;
  String? sertifikasiNo;
  String? sertifikasiDari;
  String? sertifikasiSampai;
  String? sertifikasiImage;
  String? rowStatus;

  Sertifikat(
      {this.id,
        this.kebunId,
        this.sertifikasiId,
        this.sertifikasiName,
        this.sertifikasiNo,
        this.sertifikasiDari,
        this.sertifikasiSampai,
        this.sertifikasiImage,
        this.rowStatus});

  Sertifikat.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    kebunId = json['kebun_id'];
    sertifikasiId = json['sertifikasi_id'];
    sertifikasiName = json['sertifikasi_name'];
    sertifikasiNo = json['sertifikasi_no'];
    sertifikasiDari = json['sertifikasi_dari'];
    sertifikasiSampai = json['sertifikasi_sampai'];
    sertifikasiImage = json['sertifikasi_image'];
    rowStatus = json['row_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['kebun_id'] = this.kebunId;
    data['sertifikasi_id'] = this.sertifikasiId;
    data['sertifikasi_name'] = this.sertifikasiName;
    data['sertifikasi_no'] = this.sertifikasiNo;
    data['sertifikasi_dari'] = this.sertifikasiDari;
    data['sertifikasi_sampai'] = this.sertifikasiSampai;
    data['sertifikasi_image'] = this.sertifikasiImage;
    data['row_status'] = this.rowStatus;
    return data;
  }
}