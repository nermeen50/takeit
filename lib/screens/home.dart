import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:v_room_app/App/app_event.dart';
import 'package:v_room_app/App/app_state.dart';
import 'package:v_room_app/Blocs/availableTimeHome_bloc.dart';
import 'package:v_room_app/Blocs/home_bloc.dart';
import 'package:v_room_app/generated/l10n.dart';
import 'package:v_room_app/screens/customDrawer.dart';
import 'package:v_room_app/screens/googleMap.dart';
import 'package:v_room_app/screens/resturantDetail.dart';
import 'package:v_room_app/screens/widgets/calculate_distance.dart';
import 'package:v_room_app/screens/widgets/custom_appbar.dart';
import 'package:v_room_app/screens/widgets/custom_rounded_btn.dart';
import 'package:v_room_app/screens/widgets/custom_text.dart';
import 'package:v_room_app/utils/ColorsUtils.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  GoogleMapController mapController;
  int tappedIndex;

  var intianlCameraPosition = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );
  @override
  void initState() {
    tappedIndex = 0;
    context.read<HomeBloc>().add(Filter(data: 1));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: ColorsUtils.appBackground,
      appBar: CustomAppBar(
        centerTitle: true,
        leading: [
          IconButton(
            onPressed: () async {
              _scaffoldKey.currentState.openDrawer();
            },
            icon: Icon(Icons.format_list_bulleted, color: Colors.white),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search, color: Colors.white),
          ),
        ],
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  contentPadding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  content: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: SizedBox(
                      height: 400,
                      child: GoogleMap(
                        myLocationEnabled: true,
                        initialCameraPosition: intianlCameraPosition,
                        onMapCreated: (GoogleMapController controller) {
                          mapController = controller;
                        },
                      ),
                    ),
                  ),
                  actions: <Widget>[
                    CustomRoundedButton(
                      pressed: () {
                        mapController.animateCamera(
                            CameraUpdate.newCameraPosition(
                                intianlCameraPosition));
                      },
                      textColor: ColorsUtils.primaryGreen,
                      text: 'استخدم هذا الموقع',
                      load: false,
                      backgroundColor: Colors.white,
                    ),
                  ],
                ),
              );
            },
            icon: Icon(Icons.location_on_outlined, color: Colors.white),
          ),
          IconButton(
            onPressed: () {
              Get.to(() => Maps());
            },
            icon: Icon(Icons.filter_alt_outlined, color: Colors.white),
          ),
        ],
        title: 'Takeit',
        leadingWidth: 100,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 250.h,
              width: double.infinity,
              margin: EdgeInsets.all(10),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                child: Carousel(
                  autoplayDuration: Duration(seconds: 5),
                  autoplay: true,
                  dotBgColor: Colors.transparent,
                  dotColor: ColorsUtils.greyTextColor,
                  dotIncreasedColor: ColorsUtils.primaryGreen,
                  dotSize: 8,
                  images: [
                    Image.asset(
                      'assets/images/pic4.jpg',
                      fit: BoxFit.cover,
                    ),
                    Image.asset(
                      S.current.logoImage,
                      fit: BoxFit.cover,
                    ),
                    Image.asset(
                      'assets/images/pic1.jpg',
                      fit: BoxFit.cover,
                    ),
                    Image.asset(
                      'assets/images/pic3.jpg',
                      fit: BoxFit.cover,
                    ),
                    Image.asset(
                      'assets/images/pic2.jpg',
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            BlocBuilder<HomeBloc, AppState>(builder: (_, state) {
              if (state is Loaded) {
                var userInfo = context.read<HomeBloc>().resultSearch;
                print('tttttttt${userInfo}');
                var listItem = state;
                return Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 80.h,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        children: List.generate(
                            state.mapModel.responseModel.length,
                            (index) => Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CustomRoundedButton(
                                    backgroundColor: tappedIndex == index
                                        ? ColorsUtils.primaryGreen
                                        : Colors.transparent,
                                    textColor: tappedIndex == index
                                        ? ColorsUtils.whiteColor
                                        : ColorsUtils.primaryGreen,
                                    width: 90.w,
                                    pressed: () {
                                      print(
                                          "uuuuuuuuuuuuu${state.mapModel.responseModel[index].id}");
                                      context.read<HomeBloc>().add(Filter(
                                          data: state.mapModel
                                              .responseModel[index].id));
                                      setState(() {
                                        tappedIndex = index;
                                      });
                                      print('ssssssssssss${index}');
                                    },
                                    text: state
                                        .mapModel.responseModel[index].name,
                                    load: false,
                                  ),
                                )),
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    userInfo.isNotEmpty
                        ? ListView.builder(
                            shrinkWrap: true,
                            physics: BouncingScrollPhysics(),
                            itemCount: userInfo.length,
                            itemBuilder: (context, index) {
                              var timeFormateFrom = List.generate(
                                  userInfo[index]
                                      .workingHours
                                      .shiftsTiming
                                      .length,
                                  (i) => userInfo[index]
                                      .workingHours
                                      .shiftsTiming[i]
                                      .from).toString().split(':');

                              var timeFormateTo = List.generate(
                                  userInfo[index]
                                      .workingHours
                                      .shiftsTiming
                                      .length,
                                  (i) => userInfo[index]
                                      .workingHours
                                      .shiftsTiming[i]
                                      .to).toString().split(':');

                              return Dismissible(
                                key: UniqueKey(),
                                background: Container(
                                  color: Color(0xFFeeeaf0),
                                  child: IconButton(
                                      alignment: Alignment.centerRight,
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.favorite,
                                        color: Color(0xFF898589),
                                      )),
                                ),
                                onDismissed: (direction) {
                                  if (direction ==
                                      DismissDirection.startToEnd) {
                                    print("Add to favorite");
                                  }
                                },
                                child: Card(
                                  margin: EdgeInsets.all(10),
                                  child: ListTile(
                                    contentPadding: EdgeInsets.all(10),
                                    onTap: () {
                                      Get.to(() => ResturantDetails(
                                            restruanId: userInfo[index],
                                          ));
                                    },
                                    subtitle: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                            "From : ${timeFormateFrom[0]}:${timeFormateFrom[1]} AM"),
                                        Text(
                                            "To :${timeFormateTo[0]}:${timeFormateTo[1]} PM"),
                                      ],
                                    ),
                                    title: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(userInfo[index].name),
                                        CustomRoundedButton(
                                          backgroundColor: Colors.transparent,
                                          load: false,
                                          iconLeft: true,
                                          icon:
                                              Icon(Icons.location_on_outlined),
                                          text:
                                              "${calculateDistance(24.728486, 46.649050, double.parse(userInfo[index].location.split(',').first), double.parse(userInfo[index].location.split(',').last)).toStringAsFixed(0)} KM",
                                        )
                                      ],
                                    ),
                                    minLeadingWidth: 70.w,
                                    leading: Image.asset(
                                      S.current.logoImage,
                                      width: 70.w,
                                      height: double.infinity,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              );
                            },
                          )
                        : Container(
                            margin: EdgeInsets.symmetric(vertical: 100),
                            child: CustomText(
                              text: 'Not Found Item',
                              fontWeight: FontWeight.bold,
                              fontSize: 30.sp,
                            )),
                  ],
                );
              }
              return Container(
                  padding: EdgeInsets.symmetric(vertical: 270.h),
                  child: CircularProgressIndicator(
                    color: ColorsUtils.primaryGreen,
                  ));
            }),
          ],
        ),
      ),
      drawer: CustomDrawer(),
    );
  }
}
