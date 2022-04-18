class ReservasiUpdateModel {
  bool? isSuccess;
  String? message;
  String? error;

  ReservasiUpdateModel({
    this.isSuccess,
    this.message,
    this.error
  });

  ReservasiUpdateModel.fromJson(Map<String, dynamic> json) {
    isSuccess = json['isSuccess'];
    message = json['message'];
  }

  factory ReservasiUpdateModel.withError(String error) => ReservasiUpdateModel.withError(error);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isSuccess'] = this.isSuccess;
    data['message'] = this.message;
    return data;
  }
}