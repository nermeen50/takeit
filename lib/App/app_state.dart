import 'package:v_room_app/models/response/account_model.dart';
import 'package:v_room_app/models/response/details_orders_model.dart';
import 'package:v_room_app/models/response/home_model.dart';
import 'package:v_room_app/models/response/map_model.dart';
import 'package:v_room_app/models/response/orders_model.dart';
import 'package:v_room_app/models/response/resturant_model.dart';
import 'package:v_room_app/network/networkCallback/mapper.dart';

abstract class AppState {}

class Done extends AppState {
  Mapper model;
  int id;

  Done({this.model, this.id});
}

class Error extends AppState {}

class Start extends AppState {}

class Loading extends AppState {}

class Loaded extends AppState {
  MapListModel mapModel;
  Loaded({this.mapModel});
  @override
  List<Object> get props => [mapModel];
}

class Show extends AppState {
  ResturantModel resturantModel;
  Show({this.resturantModel});
}

class Filtter extends AppState {
  List<MapModel> filtterModel;
  Filtter(this.filtterModel);
  @override
  List<Object> get props => [filtterModel];
}

class AvailbleTime extends AppState {
  HomeModel availbleTime;
  AvailbleTime({this.availbleTime});
  @override
  List<Object> get props => [availbleTime];
}

class AccountState extends AppState {
  AccountModel accountModel;
  AccountState({this.accountModel});
}

class Empty extends AppState {}

class GetAllOrdersState extends AppState {
  OrdersModel ordersModel;
  GetAllOrdersState({this.ordersModel});
}

class DetailsOrdersState extends AppState {
  DetailsOrdersModel ordersModel;
  DetailsOrdersState({this.ordersModel});
}
