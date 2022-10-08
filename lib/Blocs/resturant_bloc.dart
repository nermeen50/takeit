import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:v_room_app/App/app_event.dart';
import 'package:v_room_app/App/app_state.dart';
import 'package:v_room_app/models/response/map_model.dart';
import 'package:v_room_app/models/response/resturant_model.dart';
import 'package:v_room_app/repository/user_repository.dart';

class ResturantBloc extends Bloc<AppEvent, AppState> {
  final _resturantId = BehaviorSubject<String>();
  Function(String) get updateResturantId => _resturantId.sink.add;

  ResturantBloc() : super(Start());

  @override
  Future<void> close() {
    _resturantId.close();
    return super.close();
  }

  @override
  Stream<AppState> mapEventToState(AppEvent event) async* {
    if (event is Click) {
      yield Loading();
      ResturantModel respose =
          await UserRepository().resturantRequest(_resturantId.value);
      yield Show(resturantModel: respose);
    }
  }
}
