class ResecheduleModel {
  bool? isSuccess;
  String? message;

  ResecheduleModel({this.isSuccess, this.message});

  ResecheduleModel.fromJson(Map<String, dynamic> json) {
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