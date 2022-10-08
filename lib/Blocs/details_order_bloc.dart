import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:v_room_app/App/app_event.dart';
import 'package:v_room_app/App/app_state.dart';
import 'package:v_room_app/models/response/details_orders_model.dart';
import 'package:v_room_app/repository/user_repository.dart';

class OrderDetailsBloc extends Bloc<AppEvent, AppState> {
  OrderDetailsBloc() : super(Start());

  @override
  Future<void> close() {
    return super.close();
  }

  @override
  Stream<AppState> mapEventToState(AppEvent event) async* {
    if (event is Details) {
      try {
        yield Loading();
        DetailsOrdersModel respose =
            await UserRepository().detailsOrdersRequest(event.id.toInt());
        if (respose.status == false) {
          Fluttertoast.showToast(msg: respose.message);
        } else {
          yield DetailsOrdersState(ordersModel: respose);
        }
      } catch (error) {
        print(error);
      }
    }
  }
}
