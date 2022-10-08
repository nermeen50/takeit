import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import 'package:v_room_app/App/app_event.dart';
import 'package:v_room_app/App/app_state.dart';
import 'package:v_room_app/Blocs/forget_password_bloc.dart';
import 'package:v_room_app/Blocs/register_bloc.dart';
import 'package:v_room_app/generated/l10n.dart';
import 'package:v_room_app/screens/widgets/custom_rounded_btn.dart';
import 'package:v_room_app/screens/widgets/custom_textfield.dart';
import 'package:v_room_app/utils/ColorsUtils.dart';

class ResetPassword extends StatelessWidget {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsUtils.appBackground,
      body: Form(
        key: _globalKey,
        child: BlocBuilder<ForgetPasswordBloc, AppState>(
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
                      PinCodeTextField(
                        pinBoxOuterPadding: EdgeInsets.all(1),
                        onTextChanged: (v) {
                          if (v.length == 5) {
                            context.read<ForgetPasswordBloc>().updateCode(v);
                          }
                        },
                        pinTextStyle: TextStyle(color: Colors.black),
                        maxLength: 5,
                        autofocus: false,
                        // pinBoxColor: Color(0xFFf3f7fa),
                        defaultBorderColor: Color(0xFFf3f7fa),
                        pinBoxRadius: 10,
                        pinBoxHeight: 50,
                        pinBoxWidth: 50,
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
                        lablel: S.current.password,
                        onChanged: context
                            .read<ForgetPasswordBloc>()
                            .updateNewPassword,
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
                        lablel: S.current.conf_password,
                        onChanged: context
                            .read<ForgetPasswordBloc>()
                            .updateConfirmPassword,
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
                              context
                                  .read<ForgetPasswordBloc>()
                                  .add(ActivateCode());
                            } else {
                              return;
                            }
                          },
                          text: S.current.signup,
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
