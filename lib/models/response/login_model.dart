class LoginModel {
  LoginModel({
    this.code,
    this.status,
    this.message,
    this.responseModel,
  });

  bool status;
  int code;
  String message;
  ResponseModel responseModel;
  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
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
    this.idToken,
    this.login,
    this.name,
    this.userType,
    this.authorities,
    this.title,
  });
  String idToken;
  String login;
  String name;
  String userType;
  String title;
  List authorities;
  factory ResponseModel.fromJson(Map<String, dynamic> json) => ResponseModel(
        idToken: json["id_token"] == null ? null : json["id_token"],
        login: json["login"] == null ? null : json["login"],
        name: json["name"] == null ? null : json["name"],
        userType: json["userType"] == null ? null : json["userType"],
        authorities: json["authorities"] == null ? null : json["authorities"],
        title: json["title"] == null ? null : json["title"],
      );
  Map<String, dynamic> toJson() => {
        "id_token": idToken,
        "login": login,
        "name": name,
        "userType": userType,
        "authorities": authorities,
        "title": title,
      };
}
