

class BaseResponseModel{

  final bool status;
  final String message;
  final int responseCode;

  BaseResponseModel({
    required this.status,
    required this.message,
    this.responseCode = 200
  });

  factory BaseResponseModel.fromJson(Map<String, dynamic> json) {

    return BaseResponseModel(
        status: json['status'],
        message: json['message'],
        responseCode: json['response_code']
    );
  }
}