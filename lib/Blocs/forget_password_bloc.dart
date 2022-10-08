import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:rxdart/rxdart.dart';
import 'package:v_room_app/App/app_event.dart';
import 'package:v_room_app/App/app_state.dart';
import 'package:v_room_app/models/response/user_model.dart';
import 'package:v_room_app/repository/user_repository.dart';
import 'package:v_room_app/screens/auth/login.dart';
import 'package:v_room_app/screens/auth/reset_password.dart';

class ForgetPasswordBloc extends Bloc<AppEvent, AppState> {
  final _forgetPassword = BehaviorSubject<String>();
  final _newPassword = BehaviorSubject<String>();
  final _confirmPassword = BehaviorSubject<String>();
  final _code = BehaviorSubject<String>();

  ForgetPasswordBloc() : super(Start());

  Function(String) get updatePhone => _forgetPassword.sink.add;
  Function(String) get updateNewPassword => _newPassword.sink.add;
  Function(String) get updateConfirmPassword => _confirmPassword.sink.add;
  Function(String) get updateCode => _code.sink.add;

  @override
  Future<void> close() {
    _forgetPassword.close();
    _newPassword.close();
    _confirmPassword.close();
    _code.close();
    return super.close();
  }

  @override
  Stream<AppState> mapEventToState(AppEvent event) async* {
    if (event is Click) {
      try {
        yield Loading();
        await UserRepository()
            .forgetPasswordRequest("966${_forgetPassword.value}");
        // Fluttertoast.showToast(msg: response.responseModel.activationCode);
        // PreferenceManager.getInstance().saveString(
        //     'forgetActivationCode',
        //     response.responseModel.activationCode == null
        //         ? 'null'
        //         : response.responseModel.activationCode);

        yield Done();
        Get.to(() => ResetPassword());
      } catch (error) {
        print(error);
      }
    }
    if (event is ActivateCode) {
      if (_confirmPassword.value != _newPassword.value) {
        Fluttertoast.showToast(msg: 'من فضلك ادخل كلمة المرور بشكل متطابق');
      } else {
        try {
          yield Loading();
          UserModel response = await UserRepository()
              .resetPasswordRequest(_code.value, _newPassword.value);
          if (response.code == 500) {
            Fluttertoast.showToast(msg: response.responseModel.detail);
            yield Start();
          } else {
            Fluttertoast.showToast(msg: 'تم تغير كلمه المرور بنجاح');

            yield Done();
            Get.off(() => Login());
          }
        } catch (error) {
          print(error);
        }
      }
    }
  }
}
