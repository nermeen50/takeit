import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:rxdart/rxdart.dart';
import 'package:v_room_app/App/app_event.dart';
import 'package:v_room_app/App/app_state.dart';
import 'package:v_room_app/models/response/user_model.dart';
import 'package:v_room_app/repository/user_repository.dart';
import 'package:v_room_app/screens/auth/verification_code.dart';
import 'package:v_room_app/screens/home.dart';
import 'package:v_room_app/utils/PreferenceManger.dart';

class RegisterBloc extends Bloc<AppEvent, AppState> {
  final _name = BehaviorSubject<String>();
  final _phone = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();
  final _confirm = BehaviorSubject<String>();
  final _code = BehaviorSubject<String>();

  RegisterBloc() : super(Start());

  Function(String) get updateName => _name.sink.add;
  Function(String) get updatePhone => _phone.sink.add;
  Function(String) get updatePassword => _password.sink.add;
  Function(String) get updateConfirm => _confirm.sink.add;
  Function(String) get updateCode => _code.sink.add;

  @override
  Future<void> close() {
    _phone.close();
    _name.close();
    _confirm.close();
    _password.close();
    _code.close();
    return super.close();
  }

  @override
  Stream<AppState> mapEventToState(AppEvent event) async* {
    if (event is Click) {
      if (_confirm.value != _password.value) {
        Fluttertoast.showToast(msg: 'من فضلك ادخل كلمة المرور بشكل متطابق');
      } else {
        try {
          yield Loading();
          UserModel response = await UserRepository().registerRequest(
              _name.value, "966${_phone.value}", _password.value);
          // print("rrrrrrrrr${response.responseModel.status}");
          if (response.code == 400 &&
              response.responseModel.message == 'error.validation') {
            Fluttertoast.showToast(msg: 'برجاء ادخال رقم الجوال بصيغه صحيحه');
            print(
                "ggggggggggggg${response.responseModel.fieldErrors[0].message}");
            yield Start();
          } else if (response.code == 400 &&
              response.responseModel.message == 'error.userexists') {
            Fluttertoast.showToast(msg: response.responseModel.title);
            print("ssssssssss${response.responseModel.title}");
            yield Start();
          } else {
            Fluttertoast.showToast(msg: response.responseModel.activationCode);
            PreferenceManager.getInstance().saveString(
                'registerResponseLogin', response.responseModel.login);
            print("kkkkkkkkk${response.responseModel.login}");
            yield Done();
            Get.off(() => VerificationCode());
          }
        } catch (error) {
          print(error);
        }
      }
    }
    if (event is ActivateCode) {
      try {
        yield Loading();
        UserModel response = await UserRepository().activteRequest(
            await PreferenceManager.instance.getString('registerResponseLogin'),
            _code.value);
        if (_code.value == null) {
          Fluttertoast.showToast(msg: 'please enter activationCode');
          yield Start();
        } else if (response.code == 500) {
          await Fluttertoast.showToast(msg: response.responseModel.detail);
          yield Start();
        } else {
          Fluttertoast.showToast(msg: 'Activation Done');
          yield Done();
          Get.offAll(() => Home());
        }
      } catch (error) {
        print(error);
      }
    }
  }
}
