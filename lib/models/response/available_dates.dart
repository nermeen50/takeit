class AvailableDates {
  AvailableDates({
    this.code,
    this.status,
    this.message,
    this.responseModel,
  });

  bool status;
  int code;
  String message;
  ResponseModel responseModel;
  factory AvailableDates.fromJson(Map<String, dynamic> json) => AvailableDates(
        code: json["code"] == null ? null : json["code"],
        status: json["status"] == null ? null : json["status"],
        message: json["message"] == null ? null : json["message"],
        responseModel: json["response"] == null
            ? null
            : ResponseModel.fromJson(json['response']),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "message": message,
        "response": responseModel,
      };
}

class ResponseModel {
  ResponseModel({
    this.data,
  });

  List<String> data;

  factory ResponseModel.fromJson(Map<String, dynamic> json) => ResponseModel(
        data: List<String>.from(json["data"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x)),
      };
}
