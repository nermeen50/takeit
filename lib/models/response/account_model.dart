class AccountModel {
  AccountModel({this.responseModel, this.code, this.message, this.status});
  bool status;
  int code;
  String message;
  ResponseModel responseModel;
  factory AccountModel.fromJson(Map<String, dynamic> json) => AccountModel(
        code: json["code"] == null ? null : json["code"],
        status: json["status"] == null ? null : json["status"],
        message: json["message"] == null ? null : json["message"],
        responseModel: json['response'] == null
            ? null
            : ResponseModel.fromJson(json["response"]),
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
    this.activated,
    this.createdBy,
    this.createdDate,
    this.email,
    this.id,
    this.imageUrl,
    this.langKey,
    this.lastModifiedBy,
    this.lastModifiedDate,
    this.login,
    this.merchant,
    this.merchantId,
    this.name,
    this.roles,
    this.userType,
  });

  bool activated;
  String createdBy;
  DateTime createdDate;
  String email;
  int id;
  String imageUrl;
  String langKey;
  String lastModifiedBy;
  DateTime lastModifiedDate;
  String login;
  Merchant merchant;
  int merchantId;
  String name;
  List<Role> roles;
  String userType;

  factory ResponseModel.fromJson(Map<String, dynamic> json) => ResponseModel(
        activated: json["activated"] == null ? null : json["activated"],
        createdBy: json["createdBy"] == null ? null : json["createdBy"],
        createdDate: json["createdDate"] == null
            ? null
            : DateTime.parse(json["createdDate"]),
        email: json["email"] == null ? null : json["email"],
        id: json["id"] == null ? null : json["id"],
        imageUrl: json["imageUrl"] == null ? null : json["imageUrl"],
        langKey: json["langKey"] == null ? null : json["langKey"],
        lastModifiedBy:
            json["lastModifiedBy"] == null ? null : json["lastModifiedBy"],
        lastModifiedDate: json["lastModifiedDate"] == null
            ? null
            : DateTime.parse(json["lastModifiedDate"]),
        login: json["login"] == null ? null : json["login"],
        merchant: json["merchant"] == null
            ? null
            : Merchant.fromJson(json["merchant"]),
        merchantId: json["merchantId"] == null ? null : json["merchantId"],
        name: json["name"] == null ? null : json["name"],
        roles: json["roles"] == null
            ? null
            : List<Role>.from(json["roles"].map((x) => Role.fromJson(x))),
        userType: json["userType"] == null ? null : json["userType"],
      );

  Map<String, dynamic> toJson() => {
        "activated": activated,
        "createdBy": createdBy,
        "createdDate": createdDate.toIso8601String(),
        "email": email,
        "id": id,
        "imageUrl": imageUrl,
        "langKey": langKey,
        "lastModifiedBy": lastModifiedBy,
        "lastModifiedDate": lastModifiedDate.toIso8601String(),
        "login": login,
        "merchant": merchant.toJson(),
        "merchantId": merchantId,
        "name": name,
        "roles": List<dynamic>.from(roles.map((x) => x.toJson())),
        "userType": userType,
      };
}

class Merchant {
  Merchant({
    this.config,
    this.cuisines,
    this.id,
    this.logo,
    this.name,
  });

  String config;
  List<Cuisine> cuisines;
  int id;
  String logo;
  String name;

  factory Merchant.fromJson(Map<String, dynamic> json) => Merchant(
        config: json["config"],
        cuisines: List<Cuisine>.from(
            json["cuisines"].map((x) => Cuisine.fromJson(x))),
        id: json["id"],
        logo: json["logo"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "config": config,
        "cuisines": List<dynamic>.from(cuisines.map((x) => x.toJson())),
        "id": id,
        "logo": logo,
        "name": name,
      };
}

class Cuisine {
  Cuisine({
    this.id,
    this.name,
  });

  int id;
  String name;

  factory Cuisine.fromJson(Map<String, dynamic> json) => Cuisine(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

class Role {
  Role({
    this.authorities,
    this.id,
    this.name,
    this.roleType,
  });

  List<String> authorities;
  int id;
  String name;
  String roleType;

  factory Role.fromJson(Map<String, dynamic> json) => Role(
        authorities: List<String>.from(json["authorities"].map((x) => x)),
        id: json["id"],
        name: json["name"],
        roleType: json["roleType"],
      );

  Map<String, dynamic> toJson() => {
        "authorities": List<dynamic>.from(authorities.map((x) => x)),
        "id": id,
        "name": name,
        "roleType": roleType,
      };
}
