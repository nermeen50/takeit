class DetailsOrdersModel {
  DetailsOrdersModel({
    this.code,
    this.status,
    this.message,
    this.responseModel,
  });

  bool status;
  int code;
  String message;
  ResponseModel responseModel;
  factory DetailsOrdersModel.fromJson(Map<String, dynamic> json) =>
      DetailsOrdersModel(
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
    this.id,
    this.date,
    this.numberOfGuests,
    this.branch,
    this.user,
    this.seatGroup,
  });

  int id;
  DateTime date;
  int numberOfGuests;
  Branch branch;
  User user;
  SeatGroup seatGroup;

  factory ResponseModel.fromJson(Map<String, dynamic> json) => ResponseModel(
        id: json["id"],
        date: DateTime.parse(json["date"]),
        numberOfGuests: json["numberOfGuests"],
        branch: Branch.fromJson(json["branch"]),
        user: User.fromJson(json["user"]),
        seatGroup: SeatGroup.fromJson(json["seatGroup"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "date": date.toIso8601String(),
        "numberOfGuests": numberOfGuests,
        "branch": branch.toJson(),
        "user": user.toJson(),
        "seatGroup": seatGroup.toJson(),
      };
}

class Branch {
  Branch({
    this.id,
    this.name,
    this.latLng,
    this.config,
    this.merchant,
  });

  int id;
  dynamic name;
  dynamic latLng;
  dynamic config;
  dynamic merchant;

  factory Branch.fromJson(Map<String, dynamic> json) => Branch(
        id: json["id"],
        name: json["name"],
        latLng: json["latLng"],
        config: json["config"],
        merchant: json["merchant"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "latLng": latLng,
        "config": config,
        "merchant": merchant,
      };
}

class SeatGroup {
  SeatGroup({
    this.id,
    this.numberOfSeats,
    this.count,
    this.isOpen,
    this.placeSection,
  });

  int id;
  int numberOfSeats;
  int count;
  bool isOpen;
  PlaceSection placeSection;

  factory SeatGroup.fromJson(Map<String, dynamic> json) => SeatGroup(
        id: json["id"],
        numberOfSeats: json["numberOfSeats"],
        count: json["count"],
        isOpen: json["isOpen"],
        placeSection: PlaceSection.fromJson(json["placeSection"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "numberOfSeats": numberOfSeats,
        "count": count,
        "isOpen": isOpen,
        "placeSection": placeSection.toJson(),
      };
}

class PlaceSection {
  PlaceSection({
    this.id,
    this.name,
    this.branch,
  });

  int id;
  dynamic name;
  dynamic branch;

  factory PlaceSection.fromJson(Map<String, dynamic> json) => PlaceSection(
        id: json["id"],
        name: json["name"],
        branch: json["branch"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "branch": branch,
      };
}

class User {
  User({
    this.id,
    this.login,
    this.activationCode,
  });

  int id;
  dynamic login;
  dynamic activationCode;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        login: json["login"],
        activationCode: json["activationCode"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "login": login,
        "activationCode": activationCode,
      };
}
