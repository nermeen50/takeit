class HomeModel {
  HomeModel({
    this.data,
  });

  List<Datum> data;

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.name,
    this.availableTime,
    this.selectedRadio,
  });

  String name;
  List<String> availableTime;
  String selectedRadio;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        name: json["name"],
        selectedRadio: null,
        availableTime: List<String>.from(json["availableTime"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "selectedRadio": selectedRadio,
        "availableTime": List<dynamic>.from(availableTime.map((x) => x)),
      };
}
