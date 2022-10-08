import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:v_room_app/App/app_event.dart';
import 'package:v_room_app/App/app_state.dart';
import 'package:v_room_app/models/response/account_model.dart';
import 'package:v_room_app/repository/user_repository.dart';
import 'package:v_room_app/utils/PreferenceManger.dart';

class AccountBloc extends Bloc<AppEvent, AppState> {
  AccountBloc() : super(Start());

  @override
  Future<void> close() {
    return super.close();
  }

  @override
  Stream<AppState> mapEventToState(AppEvent event) async* {
    if (event is Click) {
      try {
        yield Loading();
        AccountModel respose = await UserRepository().accountRequest();
        print("ddddddddddddddddddd${respose}");
        if (respose.code == 500) {
          Fluttertoast.showToast(msg: respose.message);
          yield Start();
        } else {
          PreferenceManager.instance.getString('userInfo');
          yield AccountState(accountModel: respose);
        }
      } catch (error) {
        print(error);
      }
    }
  }
}
