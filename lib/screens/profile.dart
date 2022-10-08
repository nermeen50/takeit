import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:v_room_app/App/app_event.dart';
import 'package:v_room_app/App/app_state.dart';
import 'package:v_room_app/Blocs/account_bloc.dart';
import 'package:v_room_app/screens/auth/edit_profile.dart';
import 'package:v_room_app/screens/widgets/CustomListTitle.dart';
import 'package:v_room_app/screens/widgets/custom_appbar.dart';
import 'package:v_room_app/screens/widgets/custom_rounded_btn.dart';
import 'package:v_room_app/screens/widgets/custom_text.dart';
import 'package:v_room_app/utils/ColorsUtils.dart';

class Profile extends StatefulWidget {
  Profile({Key key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  void initState() {
    // TODO: implement initState
    context.read<AccountBloc>().add(Click());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title: 'ملف الشخصي',
        ),
        body: BlocBuilder<AccountBloc, AppState>(builder: (_, state) {
          if (state is Loading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is AccountState) {
            return SingleChildScrollView(
              padding: EdgeInsets.all(15.0),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 70,
                    backgroundImage:
                        AssetImage('assets/images/notFoundImage.jpg'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(text: "Name"),
                      CustomText(
                          text:
                              state.accountModel.responseModel.name.toString()),
                    ],
                  ),
                  SizedBox(height: Get.height * 0.03),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(text: "email"),
                      CustomText(
                          text: state.accountModel.responseModel.email
                              .toString()),
                    ],
                  ),
                  SizedBox(height: Get.height * 0.03),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(text: "activated"),
                      CustomText(
                          text: state.accountModel.responseModel.activated
                              .toString()),
                    ],
                  ),
                  SizedBox(height: Get.height * 0.03),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(text: "langKey"),
                      CustomText(
                          text: state.accountModel.responseModel.langKey
                              .toString()),
                    ],
                  ),
                  SizedBox(height: Get.height * 0.03),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(text: "createdBy"),
                      CustomText(
                          text: state.accountModel.responseModel.createdBy
                              .toString()),
                    ],
                  ),
                  SizedBox(height: Get.height * 0.03),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(text: "createdDate"),
                      CustomText(
                          text: state.accountModel.responseModel.createdDate
                              .toString()),
                    ],
                  ),
                  SizedBox(height: Get.height * 0.03),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(text: "lastModifiedBy"),
                      CustomText(
                          text: state.accountModel.responseModel.lastModifiedBy
                              .toString()),
                    ],
                  ),
                  SizedBox(height: Get.height * 0.03),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(text: "lastModifiedDate"),
                      CustomText(
                          text: state
                              .accountModel.responseModel.lastModifiedDate
                              .toString()),
                    ],
                  ),
                  SizedBox(height: Get.height * 0.03),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(text: "roles"),
                      Expanded(
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount:
                                state.accountModel.responseModel.roles.length,
                            itemBuilder: (context, index) {
                              return CustomText(
                                  text: state.accountModel.responseModel
                                      .roles[index].name);
                            }),
                      )
                    ],
                  ),
                  SizedBox(height: Get.height * 0.03),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(text: "userType"),
                      CustomText(
                          text: state.accountModel.responseModel.userType
                              .toString()),
                    ],
                  ),
                  SizedBox(height: Get.height * 0.03),
                  CustomRoundedButton(
                      height: Get.height * 0.07,
                      text: 'Edit',
                      load: false,
                      pressed: () => Get.to(() => EditProfile(
                            profileInfo: state.accountModel.responseModel,
                          )),
                      backgroundColor: ColorsUtils.primaryGreen,
                      textColor: ColorsUtils.whiteColor)
                ],
              ),
            );
          } else {
            return Text('');
          }
        }));
  }
}
