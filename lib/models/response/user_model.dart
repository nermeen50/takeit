class UserModel {
  UserModel({
    this.code,
    this.status,
    this.message,
    this.responseModel,
  });

  bool status;
  int code;
  String message;
  ResponseModel responseModel;
  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
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
    this.activationCode,
    this.fieldErrors,
    this.message,
    this.id,
    this.login,
    this.status,
    this.title,
    this.detail,
  });
  int status;
  List<FieldError> fieldErrors;
  String message;
  int id;
  String login;
  String activationCode;
  String title;
  String detail;
  factory ResponseModel.fromJson(Map<String, dynamic> json) => ResponseModel(
        message: json["message"] == null ? null : json["message"],
        status: json["status"] == null ? null : json["status"],
        detail: json["detail"] == null ? null : json["detail"],
        fieldErrors: json["fieldErrors"] == null
            ? null
            : List<FieldError>.from(
                json["fieldErrors"].map(
                  (x) => FieldError.fromJson(x),
                ),
              ),
        id: json["id"] == null ? null : json["id"],
        login: json["login"] == null ? null : json["login"],
        activationCode:
            json["activationCode"] == null ? null : json["activationCode"],
        title: json["title"] == null ? null : json["title"],
      );
  Map<String, dynamic> toJson() => {
        "fieldErrors": List<dynamic>.from(
          fieldErrors.map(
            (x) => x.toJson(),
          ),
        ),
        "id": id,
        "login": login,
        "activationCode": activationCode,
        "title": title,
        "message": message,
        "status": status,
        "detail": detail,
      };
}

class FieldError {
  FieldError({
    this.objectName,
    this.field,
    this.message,
  });

  String objectName;
  String field;
  String message;

  factory FieldError.fromJson(Map<String, dynamic> json) => FieldError(
        objectName: json["objectName"],
        field: json["field"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "objectName": objectName,
        "field": field,
        "message": message,
      };
}
