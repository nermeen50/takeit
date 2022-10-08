import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:v_room_app/App/app_event.dart';
import 'package:v_room_app/App/app_state.dart';
import 'package:v_room_app/Blocs/resturant_bloc.dart';
import 'package:v_room_app/screens/reservation.dart';
import 'package:v_room_app/screens/widgets/CustomListTitle.dart';
import 'package:v_room_app/screens/widgets/custom_rounded_btn.dart';
import 'package:v_room_app/screens/widgets/custom_text.dart';
import 'package:v_room_app/utils/ColorsUtils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailsHomeTab extends StatefulWidget {
  final int restruanId;

  const DetailsHomeTab({Key key, this.restruanId}) : super(key: key);
  @override
  _DetailsHomeTabState createState() => _DetailsHomeTabState();
}

class _DetailsHomeTabState extends State<DetailsHomeTab> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context
        .read<ResturantBloc>()
        .updateResturantId(widget.restruanId.toString());
    context.read<ResturantBloc>().add(Click());
  }

  @override
  Widget build(BuildContext context) {
    print(widget.restruanId);
    return Scaffold(
      body: BlocBuilder<ResturantBloc, AppState>(builder: (_, state) {
        return SingleChildScrollView(
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              // background image and bottom contents
              Column(
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    height: 200.h,
                    child: Image.asset(
                      'assets/images/pic1.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    height: 420.h,
                  ),
                  Container(
                    color: ColorsUtils.whiteColor,
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Column(
                      children: [
                        Icon(
                          Icons.photo_library_outlined,
                          color: ColorsUtils.primaryGreen,
                          size: 40.sp,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        GridView.count(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          crossAxisCount: 3,
                          padding: EdgeInsets.zero,
                          mainAxisSpacing: 1,
                          crossAxisSpacing: 1,
                          children: List.generate(
                            20,
                            (index) => Image.asset(
                              'assets/images/pic2.jpg',
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),

              Positioned(
                top: 180.h,
                child: Stack(
                  clipBehavior: Clip.none,
                  alignment: AlignmentDirectional.topCenter,
                  children: <Widget>[
                    Container(
                      height: 430.h,
                      width: 430.w,
                      padding: EdgeInsets.only(top: 70.h, right: 10, left: 10),
                      decoration: BoxDecoration(
                          color: ColorsUtils.whiteColor,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20))),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomText(
                                text: state.toString(),
                              ),
                              Icon(
                                Icons.check_circle,
                                color: ColorsUtils.blueColor,
                              )
                            ],
                          ),
                          Icon(
                            Icons.check_circle,
                            color: ColorsUtils.blueColor,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  CustomText(
                                    text: '280 ',
                                  ),
                                  CustomText(
                                    text: 'متابع ',
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  CustomText(
                                    text: '0 ',
                                  ),
                                  CustomText(
                                    text: 'متابعة ',
                                  ),
                                ],
                              ),
                              Container(
                                width: 100.w,
                                height: 48.h,
                                child: CustomRoundedButton(
                                  load: false,
                                  backgroundColor: ColorsUtils.primaryGreen,
                                  borderColor: ColorsUtils.primaryGreen,
                                  pressed: () {},
                                  text: 'متابعه',
                                  textColor: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              CustomText(
                                text: 'محمد ',
                              ),
                              CustomText(
                                text: 'محمد ',
                              ),
                              CustomText(
                                text: 'محمد ',
                              ),
                              CustomText(
                                text: 'محمد ',
                              ),
                            ],
                          ),
                          Container(
                            width: 100.w,
                            height: 48.h,
                            margin: EdgeInsets.symmetric(vertical: 10),
                            child: CustomRoundedButton(
                              load: false,
                              backgroundColor: ColorsUtils.primaryGreen,
                              borderColor: ColorsUtils.primaryGreen,
                              pressed: () {
                                showModalBottomSheet(
                                    context: context,
                                    isScrollControlled: true,
                                    builder: (context) {
                                      return Container(
                                        height: 800.h,
                                        child: Padding(
                                          padding: EdgeInsets.all(20),
                                          child: SingleChildScrollView(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.min,
                                              children: <Widget>[
                                                CustomText(
                                                  text: 'معلومات عن المطعم',
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                CustomListTitle(
                                                  title: 'العنوان',
                                                  iconData: Icons
                                                      .location_on_outlined,
                                                  subTitle:
                                                      'معلومات عن المطعم معلومات عن المطعم معلومات عن المطعم',
                                                ),
                                                Container(
                                                  height: 200.h,
                                                  child: GoogleMap(
                                                    myLocationEnabled: true,
                                                    initialCameraPosition:
                                                        CameraPosition(
                                                            target: LatLng(
                                                                37.42796133580664,
                                                                -122.085749655962),
                                                            zoom: 14.4746,
                                                            bearing: 0),
                                                    onMapCreated:
                                                        (GoogleMapController
                                                            controller) {},
                                                  ),
                                                ),
                                                CustomListTitle(
                                                  title: 'رقم التليفون',
                                                  iconData: Icons.call,
                                                  subTitle: '5555578778',
                                                ),
                                                CustomListTitle(
                                                  title: 'الاكلات',
                                                  iconData:
                                                      Icons.food_bank_rounded,
                                                ),
                                                CustomListTitle(
                                                  title: 'السعر',
                                                  iconData: Icons
                                                      .price_change_outlined,
                                                  subTitle: '120 خصم',
                                                ),
                                                CustomListTitle(
                                                  title: 'عدد ساعات العمل',
                                                  iconData: Icons.access_time,
                                                  subTitle:
                                                      '9صباحا - 5 مساء يوم الاحد - و الاثنين ز التلاتاء',
                                                ),
                                                CustomListTitle(
                                                  title: 'طريقه الرفع',
                                                  iconData: Icons.payment_sharp,
                                                ),
                                                CustomListTitle(
                                                  title: 'الموقع',
                                                  iconData: Icons
                                                      .error_outline_outlined,
                                                  subTitle: 'غير متاح',
                                                ),
                                                CustomListTitle(
                                                  title: 'التفاصيل',
                                                  iconData: Icons.details,
                                                  subTitle:
                                                      '120 معلومات عن المطعم معلومات عن المطعم معلومات عن المطعم',
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    });
                              },
                              text: 'المزيد',
                              textColor: Colors.white,
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: 60.h,
                            child: CustomRoundedButton(
                              load: false,
                              backgroundColor: ColorsUtils.primaryGreen,
                              borderColor: ColorsUtils.primaryGreen,
                              pressed: () {
                                Get.to(() => Reservation());
                              },
                              text: 'الحجز',
                              textColor: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: -50,
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage:
                            NetworkImage('https://picsum.photos/250?image=2'),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
