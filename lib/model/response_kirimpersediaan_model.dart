class KirimPersediaanModel {
  bool? isSuccess;
  String? message;
  String? error;

  KirimPersediaanModel({this.isSuccess, this.message, this.error});

  factory KirimPersediaanModel.withError(String error) => KirimPersediaanModel(error: error);

  KirimPersediaanModel.fromJson(Map<String, dynamic> json) {
    isSuccess = json['isSuccess'];
    message = json['message'];
    }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isSuccess'] = this.isSuccess;
    data['message'] = this.message;
    return data;
  }
}