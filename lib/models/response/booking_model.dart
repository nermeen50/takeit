class BookingModel {
  BookingModel({
    this.code,
    this.status,
    this.message,
    this.responseModel,
  });

  bool status;
  int code;
  String message;
  ResponseModel responseModel;
  factory BookingModel.fromJson(Map<String, dynamic> json) => BookingModel(
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

  List<Datum> data;

  factory ResponseModel.fromJson(Map<String, dynamic> json) => ResponseModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.sectionId,
    this.sectionName,
    this.availableSlots,
    this.selectedRadio,
  });

  int sectionId;
  String sectionName;
  List<String> availableSlots;
  String selectedRadio;
  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        sectionId: json["sectionId"],
        selectedRadio: null,
        sectionName: json["sectionName"],
        availableSlots: List<String>.from(json["availableSlots"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "sectionId": sectionId,
        "sectionName": sectionName,
        "availableSlots": List<dynamic>.from(availableSlots.map((x) => x)),
      };
}
