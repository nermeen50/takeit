import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:v_room_app/App/app_event.dart';
import 'package:v_room_app/App/app_state.dart';
import 'package:v_room_app/models/response/home_model.dart';

class AvailableTimeHomeBloc extends Bloc<AppEvent, AppState> {
  int previousIndex = 0;
  HomeModel homeModel;
  AvailableTimeHomeBloc() : super(Start());

  @override
  Future<void> close() {
    return super.close();
  }

  @override
  Stream<AppState> mapEventToState(AppEvent event) async* {
    if (event is BookingTime) {
      try {
        yield Loading();
        homeModel = HomeModel(data: [
          Datum(
              availableTime: ["06:00", "07:00", "08:30"],
              name: 'interior 1',
              selectedRadio: null),
          Datum(
              availableTime: ["06:00", "07:00", "08:30"],
              name: 'interior 2',
              selectedRadio: null),
          Datum(
              availableTime: ["06:00", "07:00", "08:30"],
              name: 'interior 3',
              selectedRadio: null),
        ]);
        if (previousIndex != event.data) {
          homeModel.data[previousIndex].selectedRadio = null;
          previousIndex = event.data;
        }
        homeModel.data[event.data].selectedRadio = event.newval;

        yield AvailbleTime(availbleTime: homeModel);
      } catch (errorExaption) {
        Fluttertoast.showToast(msg: 'errorExaption');
        yield Start();
      }
    }
  }
}
