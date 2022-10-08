import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:v_room_app/App/app_event.dart';
import 'package:v_room_app/App/app_state.dart';
import 'package:v_room_app/models/response/map_model.dart';
import 'package:v_room_app/repository/user_repository.dart';

class HomeBloc extends Bloc<AppEvent, AppState> {
  List<MapModel> resultSearch = [];
  MapListModel categoryrespose;
  MapListModel headerResponse;
  var seletedItem;

  HomeBloc() : super(Start());

  @override
  Future<void> close() {
    return super.close();
  }

  @override
  Stream<AppState> mapEventToState(AppEvent event) async* {
    if (event is Filter) {
      try {
        yield Loading();
        categoryrespose =
            await UserRepository().getLatLogMap('24.728486,46.649050');
        headerResponse = await UserRepository().filtterRequest();
        if (headerResponse.responseModel.isNotEmpty) {
          resultSearch.clear();
          categoryrespose.responseModel.forEach((item) => {
                seletedItem = item.cuisines
                    .where((cuisinesItem) => cuisinesItem.id == event.data)
                    .toList(),
                if (seletedItem.length > 0)
                  {
                    resultSearch.add(item),
                    print(resultSearch),
                  }
              });
          yield Loaded(mapModel: headerResponse);
        } else {
          Fluttertoast.showToast(msg: "Not found item");
          yield Start();
        }
      } catch (errorExaption) {
        Fluttertoast.showToast(msg: 'errorExaption');
        yield Start();
      }
    }
  }
}
