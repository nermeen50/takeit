import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:rxdart/rxdart.dart';
import 'package:v_room_app/App/app_event.dart';
import 'package:v_room_app/App/app_state.dart';
import 'package:v_room_app/models/response/login_model.dart';
import 'package:v_room_app/repository/user_repository.dart';
import 'package:v_room_app/screens/home.dart';
import 'package:v_room_app/utils/PreferenceManger.dart';
import 'package:v_room_app/utils/TokenUtil.dart';

class LoginBloc extends Bloc<AppEvent, AppState> {
  final _userName = BehaviorSubject<String>();
  final _remeberMe = BehaviorSubject<bool>();
  final _password = BehaviorSubject<String>();

  LoginBloc() : super(Start());

  Function(String) get updateUserName => _userName.sink.add;
  Function(bool) get updateRemberMe => _remeberMe.sink.add;
  Function(String) get updatePassword => _password.sink.add;

  @override
  Future<void> close() {
    _userName.close();
    _remeberMe.close();
    _password.close();
    return super.close();
  }

  @override
  Stream<AppState> mapEventToState(AppEvent event) async* {
    if (event is Click) {
      try {
        yield Loading();
        LoginModel respose = await UserRepository().loginRequest(
            _password.value,
            "966${_userName.value}",
            _remeberMe.value == null ? false : _remeberMe.value);
        print("ddddddddddddddddddd${respose}");
        if (respose.code == 401) {
          Fluttertoast.showToast(msg: respose.message);
          yield Start();
        } else {
          Fluttertoast.showToast(msg: respose.responseModel.userType);
          PreferenceManager.getInstance()
              .saveString('token', respose.responseModel.idToken);
          PreferenceManager.getInstance()
              .saveString('userInfo', respose.responseModel.toString());
          yield Done();
          Get.offAll(() => Home());
        }
      } catch (error) {
        print(error);
      }
    }
  }
}
