class ChangePasswordModel {
  ChangePasswordModel(
      {this.responseModel, this.code, this.message, this.status});

  bool status;
  int code;
  String message;
  ResponseModel responseModel;
  factory ChangePasswordModel.fromJson(Map<String, dynamic> json) =>
      ChangePasswordModel(
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
    this.type,
    this.title,
    this.status,
    this.detail,
    this.path,
    this.message,
  });

  String type;
  String title;
  int status;
  String detail;
  String path;
  String message;

  factory ResponseModel.fromJson(Map<String, dynamic> json) => ResponseModel(
        type: json["type"],
        title: json["title"],
        status: json["status"],
        detail: json["detail"],
        path: json["path"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "title": title,
        "status": status,
        "detail": detail,
        "path": path,
        "message": message,
      };
}
