import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:v_room_app/App/app_event.dart';
import 'package:v_room_app/App/app_state.dart';
import 'package:v_room_app/models/response/details_orders_model.dart';
import 'package:v_room_app/models/response/orders_model.dart';
import 'package:v_room_app/repository/user_repository.dart';

class OrdersBloc extends Bloc<AppEvent, AppState> {
  OrdersBloc() : super(Start());

  @override
  Future<void> close() {
    return super.close();
  }

  @override
  Stream<AppState> mapEventToState(AppEvent event) async* {
    if (event is Click) {
      try {
        yield Loading();
        OrdersModel respose = await UserRepository().getAllOrdersRequest();
        if (respose.status == false) {
          Fluttertoast.showToast(msg: respose.message);
        } else {
          yield GetAllOrdersState(ordersModel: respose);
        }
      } catch (error) {
        print(error);
      }
    }
  }
}
