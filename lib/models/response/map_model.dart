class MapListModel {
  bool status;
  int code;
  String message;
  List<MapModel> responseModel;
  MapListModel({
    this.responseModel,
    this.code,
    this.status,
    this.message,
  });
  factory MapListModel.fromJson(Map<String, dynamic> json) => MapListModel(
        code: json["code"] == null ? null : json["code"],
        status: json["status"] == null ? null : json["status"],
        message: json["message"] == null ? null : json["message"],
        responseModel: json['response'] == null
            ? null
            : List<MapModel>.from(
                json["response"].map((x) => MapModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "response": responseModel,
        "code": code,
        "status": status,
        "message": message,
      };
}

class MapModel {
  MapModel({
    this.id,
    this.restaurantId,
    this.name,
    this.location,
    this.logo,
    this.cuisines,
    this.workingHours,
  });

  int id;
  int restaurantId;
  String name;
  String location;
  String logo;
  List<Cuisine> cuisines;
  WorkingHours workingHours;

  factory MapModel.fromJson(Map<String, dynamic> json) => MapModel(
        id: json["id"],
        restaurantId: json["restaurantId"],
        name: json["name"],
        location: json["location"],
        logo: json["logo"],
        cuisines: json["cuisines"] != null
            ? List<Cuisine>.from(
                json["cuisines"].map((x) => Cuisine.fromJson(x)))
            : null,
        workingHours: json["workingHours"] != null
            ? WorkingHours.fromJson(json["workingHours"])
            : null,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "restaurantId": restaurantId,
        "name": name,
        "location": location,
        "logo": logo,
        "cuisines": List<dynamic>.from(cuisines.map((x) => x.toJson())),
        "workingHours": workingHours.toJson(),
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

class WorkingHours {
  WorkingHours({
    this.shiftsTiming,
  });

  List<ShiftsTiming> shiftsTiming;

  factory WorkingHours.fromJson(Map<String, dynamic> json) => WorkingHours(
        shiftsTiming: List<ShiftsTiming>.from(
            json["shiftsTiming"].map((x) => ShiftsTiming.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "shiftsTiming": List<dynamic>.from(shiftsTiming.map((x) => x.toJson())),
      };
}

class ShiftsTiming {
  ShiftsTiming({
    this.from,
    this.to,
  });

  String from;
  String to;

  factory ShiftsTiming.fromJson(Map<String, dynamic> json) => ShiftsTiming(
        from: json["from"],
        to: json["to"],
      );

  Map<String, dynamic> toJson() => {
        "from": from,
        "to": to,
      };
}
