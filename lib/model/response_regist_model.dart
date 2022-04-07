class registerModel {
  int? code;
  bool? isSuccess;
  String? message;
  String? error;

  registerModel({this.code,this.isSuccess,this.message, this.error});

  registerModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    isSuccess = json['isSuccess'];
    message = json['message'];
  }

  factory registerModel.withError(String error) => registerModel(error: error);

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['isSuccess'] = this.isSuccess;
    data['message'] = this.message;
    return data;
  }
}