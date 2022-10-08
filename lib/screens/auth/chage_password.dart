import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import 'package:v_room_app/App/app_event.dart';
import 'package:v_room_app/App/app_state.dart';
import 'package:v_room_app/Blocs/change_password_bloc.dart';
import 'package:v_room_app/Blocs/forget_password_bloc.dart';
import 'package:v_room_app/Blocs/register_bloc.dart';
import 'package:v_room_app/generated/l10n.dart';
import 'package:v_room_app/screens/widgets/custom_rounded_btn.dart';
import 'package:v_room_app/screens/widgets/custom_textfield.dart';
import 'package:v_room_app/utils/ColorsUtils.dart';

class ChangePassword extends StatelessWidget {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsUtils.appBackground,
      body: Form(
        key: _globalKey,
        child: BlocBuilder<ChangPaawordeBloc, AppState>(
          builder: (_, state) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        S.current.logoImage,
                        scale: 4.5,
                      ),
                      SizedBox(
                        height: 60,
                      ),
                      CustomTextField(
                        validator: (String v) {
                          if (v.length < 6) {
                            return "ادخل كلمة المرور بشكل صحيح";
                          }
                        },
                        lablel: "current Password",
                        onChanged: context
                            .read<ChangPaawordeBloc>()
                            .updateCurrentPassword,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                        validator: (String v) {
                          if (v.length < 6) {
                            return "ادخل كلمة المرور بشكل صحيح";
                          }
                        },
                        lablel: "New Password",
                        onChanged:
                            context.read<ChangPaawordeBloc>().updateNewPassword,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 48,
                        child: CustomRoundedButton(
                          load: state is Loading ? true : false,
                          backgroundColor: ColorsUtils.primaryGreen,
                          borderColor: ColorsUtils.primaryGreen,
                          pressed: () {
                            if (_globalKey.currentState.validate()) {
                              context.read<ChangPaawordeBloc>().add(Click());
                            } else {
                              return;
                            }
                          },
                          text: 'Edit',
                          textColor: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
