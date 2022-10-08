import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:v_room_app/App/app_event.dart';
import 'package:v_room_app/App/app_state.dart';
import 'package:v_room_app/Blocs/account_bloc.dart';
import 'package:v_room_app/Blocs/edit_profile_bloc.dart';

import 'package:v_room_app/models/response/account_model.dart';
import 'package:v_room_app/screens/widgets/custom_rounded_btn.dart';
import 'package:v_room_app/screens/widgets/custom_textfield.dart';
import 'package:v_room_app/utils/ColorsUtils.dart';

class EditProfile extends StatefulWidget {
  final ResponseModel profileInfo;
  EditProfile({this.profileInfo});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  TextEditingController controller1 = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    controller1
      ..text = widget.profileInfo.name == null
          ? "Not Found"
          : widget.profileInfo.name;
    context.read<EditProfileBloc>().updateName(widget.profileInfo.name);
    context.read<EditProfileBloc>().updateEmail(widget.profileInfo.email);
    context.read<EditProfileBloc>().updateActived(widget.profileInfo.activated);
    context.read<EditProfileBloc>().updateLanKey(widget.profileInfo.langKey);
    context
        .read<EditProfileBloc>()
        .updateCreatedBy(widget.profileInfo.createdBy);
    context
        .read<EditProfileBloc>()
        .updatecreatedDate(widget.profileInfo.createdDate.toIso8601String());
    context
        .read<EditProfileBloc>()
        .updateLastModifiedBy(widget.profileInfo.lastModifiedBy);
    context.read<EditProfileBloc>().updateLastModifiedDate(
        widget.profileInfo.lastModifiedDate.toIso8601String());
    context.read<EditProfileBloc>().updateLogin(widget.profileInfo.login);
    context.read<EditProfileBloc>().updateUserType(widget.profileInfo.userType);
    context.read<EditProfileBloc>().updateImageUrl(widget.profileInfo.imageUrl);
    context.read<EditProfileBloc>().updateId(widget.profileInfo.id);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsUtils.appBackground,
      body: Form(
        key: _globalKey,
        child: BlocBuilder<EditProfileBloc, AppState>(
          builder: (_, state) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Center(
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircleAvatar(
                        radius: 70,
                        backgroundImage:
                            AssetImage('assets/images/notFoundImage.jpg'),
                      ),
                      SizedBox(height: 60),
                      CustomTextField(
                          onChanged: (value) =>
                              context.read<EditProfileBloc>().updateName(value),
                          controller: controller1),
                      SizedBox(height: Get.height * 0.03),
                      CustomTextField(
                        validator: (String v) {
                          if (v.isEmpty) {
                            return "ادخل الحقل";
                          }
                        },
                        onChanged: context.read<EditProfileBloc>().updateEmail,
                        controller: TextEditingController(
                            text: widget.profileInfo.email == null
                                ? "Not Found"
                                : widget.profileInfo.email.toString()),
                      ),
                      SizedBox(height: Get.height * 0.03),
                      CustomTextField(
                        onChanged:
                            context.read<EditProfileBloc>().updateActived,
                        controller: TextEditingController(
                            text: widget.profileInfo.activated.toString()),
                      ),
                      SizedBox(height: Get.height * 0.03),
                      CustomTextField(
                        onChanged: context.read<EditProfileBloc>().updateLanKey,
                        controller: TextEditingController(
                            text: widget.profileInfo.langKey == null
                                ? "Not Found"
                                : widget.profileInfo.langKey.toString()),
                      ),
                      SizedBox(height: Get.height * 0.03),
                      CustomTextField(
                        onChanged:
                            context.read<EditProfileBloc>().updateCreatedBy,
                        controller: TextEditingController(
                            text: widget.profileInfo.createdBy == null
                                ? "Not Found"
                                : widget.profileInfo.createdBy.toString()),
                      ),
                      SizedBox(height: Get.height * 0.03),
                      CustomTextField(
                        onChanged:
                            context.read<EditProfileBloc>().updatecreatedDate,
                        controller: TextEditingController(
                            text: widget.profileInfo.createdDate == null
                                ? "Not Found"
                                : widget.profileInfo.createdDate.toString()),
                      ),
                      SizedBox(height: Get.height * 0.03),
                      CustomTextField(
                        onChanged: context
                            .read<EditProfileBloc>()
                            .updateLastModifiedBy,
                        controller: TextEditingController(
                            text: widget.profileInfo.lastModifiedBy == null
                                ? "Not Found"
                                : widget.profileInfo.lastModifiedBy.toString()),
                      ),
                      SizedBox(height: Get.height * 0.03),
                      CustomTextField(
                        onChanged: context
                            .read<EditProfileBloc>()
                            .updateLastModifiedDate,
                        controller: TextEditingController(
                            text: widget.profileInfo.lastModifiedDate == null
                                ? "Not Found"
                                : widget.profileInfo.lastModifiedDate
                                    .toString()),
                      ),
                      SizedBox(height: Get.height * 0.03),
                      CustomTextField(
                        validator: (String v) {
                          if (v.isEmpty) {
                            return "ادخل الحقل";
                          }
                        },
                        onChanged:
                            context.read<EditProfileBloc>().updateUserType,
                        controller: TextEditingController(
                            text: widget.profileInfo.login == null
                                ? "Not Found"
                                : widget.profileInfo.login.toString()),
                      ),
                      SizedBox(height: Get.height * 0.03),
                      CustomTextField(
                        onChanged: context
                            .read<EditProfileBloc>()
                            .updateLastModifiedDate,
                        controller: TextEditingController(
                            text: widget.profileInfo.lastModifiedDate == null
                                ? "Not Found"
                                : widget.profileInfo.lastModifiedDate
                                    .toString()),
                      ),
                      SizedBox(height: Get.height * 0.03),
                      CustomTextField(
                        validator: (String v) {
                          if (v.isEmpty) {
                            return "ادخل الحقل";
                          }
                        },
                        onChanged:
                            context.read<EditProfileBloc>().updateUserType,
                        controller: TextEditingController(
                            text: widget.profileInfo.userType == null
                                ? "Not Found"
                                : widget.profileInfo.userType.toString()),
                      ),
                      SizedBox(height: Get.height * 0.03),
                      Container(
                        height: 48,
                        child: CustomRoundedButton(
                          load: state is Loading ? true : false,
                          backgroundColor: ColorsUtils.primaryGreen,
                          borderColor: ColorsUtils.primaryGreen,
                          pressed: () {
                            if (_globalKey.currentState.validate()) {
                              context.read<EditProfileBloc>().add(Edit());
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
