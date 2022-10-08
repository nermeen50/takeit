import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:rxdart/rxdart.dart';
import 'package:v_room_app/App/app_event.dart';
import 'package:v_room_app/App/app_state.dart';
import 'package:v_room_app/models/response/change_password_model.dart';
import 'package:v_room_app/models/response/map_model.dart';
import 'package:v_room_app/repository/user_repository.dart';
import 'package:v_room_app/screens/home.dart';

class ChangPaawordeBloc extends Bloc<AppEvent, AppState> {
  final _currentPassword = BehaviorSubject<String>();
  final _newPassword = BehaviorSubject<String>();
  ChangPaawordeBloc() : super(Start());
  Function(String) get updateCurrentPassword => _currentPassword.sink.add;
  Function(String) get updateNewPassword => _newPassword.sink.add;
  @override
  Future<void> close() {
    _currentPassword.close();
    _newPassword.close();
    return super.close();
  }

  @override
  Stream<AppState> mapEventToState(AppEvent event) async* {
    if (event is Click) {
      try {
        yield Loading();
        ChangePasswordModel respose = await UserRepository()
            .changePasswordRequest(_currentPassword.value, _newPassword.value);
        print(respose.responseModel);
        if (respose.code == 415) {
          Fluttertoast.showToast(msg: respose.responseModel.title);
          yield Start();
        } else {
          Fluttertoast.showToast(msg: "Done");
          yield Done();
          Get.offAll(() => Home());
        }
      } catch (errorExaption) {
        Fluttertoast.showToast(msg: 'errorExaption');
        yield Start();
      }
    }
  }
}
