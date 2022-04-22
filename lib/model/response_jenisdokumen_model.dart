class JenisDokumenModel {
  bool? isSuccess;
  String? message;
  List<Data>? data;
  String? error;

  JenisDokumenModel({this.isSuccess, this.message, this.data, this.error});

  factory JenisDokumenModel.withError(String error) => JenisDokumenModel(error: error);

  JenisDokumenModel.fromJson(Map<String, dynamic> json) {
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
  int? dokumenId;
  String? dokumenName;
  String? dokumenJenis;
  Null? dokumenNoBlanko;
  String? dokumenBerlakuDari;
  String? dokumenBerlakuSampai;

  Data(
      {this.dokumenId,
        this.dokumenName,
        this.dokumenJenis,
        this.dokumenNoBlanko,
        this.dokumenBerlakuDari,
        this.dokumenBerlakuSampai});

  Data.fromJson(Map<String, dynamic> json) {
    dokumenId = json['dokumen_id'];
    dokumenName = json['dokumen_name'];
    dokumenJenis = json['dokumen_jenis'];
    dokumenNoBlanko = json['dokumen_no_blanko'];
    dokumenBerlakuDari = json['dokumen_berlaku_dari'];
    dokumenBerlakuSampai = json['dokumen_berlaku_sampai'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dokumen_id'] = this.dokumenId;
    data['dokumen_name'] = this.dokumenName;
    data['dokumen_jenis'] = this.dokumenJenis;
    data['dokumen_no_blanko'] = this.dokumenNoBlanko;
    data['dokumen_berlaku_dari'] = this.dokumenBerlakuDari;
    data['dokumen_berlaku_sampai'] = this.dokumenBerlakuSampai;
    return data;
  }
}