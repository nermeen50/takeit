import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:v_room_app/App/app_event.dart';
import 'package:v_room_app/App/app_state.dart';
import 'package:v_room_app/Blocs/login_bloc.dart';
import 'package:v_room_app/generated/l10n.dart';
import 'package:v_room_app/screens/auth/forget_password.dart';
import 'package:v_room_app/screens/auth/signup.dart';
import 'package:v_room_app/screens/widgets/custom_rounded_btn.dart';
import 'package:v_room_app/screens/widgets/custom_textfield.dart';
import 'package:v_room_app/utils/ColorsUtils.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool rememberMe = false;
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsUtils.appBackground,
      body: Form(
        key: _globalKey,
        child: BlocBuilder<LoginBloc, AppState>(
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
                            return "ادخل رقم الجوال ";
                          }
                        },
                        lablel: S.current.phone,
                        isMobile: true,
                        isPhoneCode: true,
                        onChanged: context.read<LoginBloc>().updateUserName,
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
                        hasPassword: true,
                        onChanged: context.read<LoginBloc>().updatePassword,
                      ),
                      CheckboxListTile(
                        title: Text(S.current.rememberMe),
                        value: rememberMe,
                        onChanged: (newValue) {
                          setState(() {
                            rememberMe = newValue;
                            context
                                .read<LoginBloc>()
                                .updateRemberMe(rememberMe);
                            print(rememberMe.toString());
                          });
                        },
                        controlAffinity: ListTileControlAffinity.leading,
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
                              context.read<LoginBloc>().add(Click());
                            } else {
                              return;
                            }
                          },
                          text: S.current.login,
                          textColor: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      ForgetPassword()));
                            },
                            child: Text(
                              S.current.forget_password,
                              style: TextStyle(
                                  color: ColorsUtils.greyTextColor,
                                  decoration: TextDecoration.underline),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (ctx) => SignUp()));
                        },
                        child: Text(
                          S.current.signup_now,
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: ColorsUtils.greyTextColor),
                        ),
                      ),
                      SizedBox(
                        height: 25,
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
