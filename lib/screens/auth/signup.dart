import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:v_room_app/App/app_event.dart';
import 'package:v_room_app/App/app_state.dart';
import 'package:v_room_app/Blocs/register_bloc.dart';
import 'package:v_room_app/generated/l10n.dart';
import 'package:v_room_app/screens/widgets/custom_rounded_btn.dart';
import 'package:v_room_app/screens/widgets/custom_textfield.dart';
import 'package:v_room_app/utils/ColorsUtils.dart';

class SignUp extends StatelessWidget {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsUtils.appBackground,
      body: Form(
        key: _globalKey,
        child: BlocBuilder<RegisterBloc, AppState>(
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
                          if (v.isEmpty) {
                            return "ادخل الاسم ";
                          }
                        },
                        lablel: S.current.firstName,
                        onChanged: context.read<RegisterBloc>().updateName,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                        validator: (String v) {
                          if (v.length < 6) {
                            return "ادخل رقم الجوال ";
                          }
                        },
                        lablel: S.current.phone,
                        isMobile: true,
                        isPhoneCode: true,
                        onChanged: context.read<RegisterBloc>().updatePhone,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                        lablel: S.current.password,
                        validator: (String v) {
                          if (v.length < 6) {
                            return "ادخل كلمة المرور بشكل صحيح";
                          }
                        },
                        hasPassword: true,
                        onChanged: context.read<RegisterBloc>().updatePassword,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                        lablel: S.current.conf_password,
                        validator: (String v) {
                          if (v.length < 6) {
                            return "ادخل كلمة المرور بشكل صحيح";
                          }
                        },
                        hasPassword: true,
                        onChanged: context.read<RegisterBloc>().updateConfirm,
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Container(
                        height: 48,
                        child: CustomRoundedButton(
                          load: state is Loading ? true : false,
                          backgroundColor: ColorsUtils.primaryGreen,
                          borderColor: ColorsUtils.primaryGreen,
                          pressed: () {
                            if (_globalKey.currentState.validate()) {
                              context.read<RegisterBloc>().add(Click());
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
