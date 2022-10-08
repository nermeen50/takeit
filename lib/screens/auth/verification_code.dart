import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import 'package:v_room_app/App/app_event.dart';
import 'package:v_room_app/App/app_state.dart';
import 'package:v_room_app/Blocs/register_bloc.dart';
import 'package:v_room_app/generated/l10n.dart';
import 'package:v_room_app/screens/widgets/custom_rounded_btn.dart';
import 'package:v_room_app/utils/ColorsUtils.dart';

class VerificationCode extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsUtils.appBackground,
      body: BlocBuilder<RegisterBloc, AppState>(
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
                          context.read<RegisterBloc>().updateCode(v);
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
                      height: 25,
                    ),
                    Container(
                      height: 48,
                      child: CustomRoundedButton(
                        load: state is Loading ? true : false,
                        text: S.current.verifiy,
                        pressed: () {
                          context.read<RegisterBloc>().add(ActivateCode());
                        },
                        backgroundColor: ColorsUtils.primaryGreen,
                        borderColor: ColorsUtils.primaryGreen,
                        textColor: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
