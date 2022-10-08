import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:v_room_app/App/app_event.dart';
import 'package:v_room_app/App/app_state.dart';
import 'package:v_room_app/Blocs/resturant_bloc.dart';
import 'package:v_room_app/generated/l10n.dart';
import 'package:v_room_app/models/response/map_model.dart';
import 'package:v_room_app/screens/booking_now.dart';
import 'package:v_room_app/screens/widgets/CustomListTitle.dart';
import 'package:v_room_app/screens/widgets/custom_appbar.dart';
import 'package:v_room_app/screens/widgets/custom_rounded_btn.dart';
import 'package:v_room_app/screens/widgets/custom_text.dart';
import 'package:v_room_app/utils/ColorsUtils.dart';

class ResturantDetails extends StatefulWidget {
  final dynamic restruanId;

  const ResturantDetails({Key key, this.restruanId}) : super(key: key);
  @override
  _ResturantDetailsState createState() => _ResturantDetailsState();
}

class _ResturantDetailsState extends State<ResturantDetails> {
  GoogleMapController mapController;
  List<Marker> _markers = <Marker>[];

  @override
  void initState() {
    // initialise your tab controller here
    context
        .read<ResturantBloc>()
        .updateResturantId(widget.restruanId.id.toString());
    context.read<ResturantBloc>().add(Click());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsUtils.appBackground,
      appBar: CustomAppBar(
        centerTitle: true,
        title: widget.restruanId.name,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BlocBuilder<ResturantBloc, AppState>(builder: (_, state) {
                if (state is Show) {
                  print(double.parse(state.resturantModel.responseModel.location
                      .split(',')
                      .first));
                  _markers.add(Marker(
                      markerId: MarkerId('SomeId'),
                      position: LatLng(
                          double.parse(state
                              .resturantModel.responseModel.location
                              .split(',')
                              .first),
                          double.parse(state
                              .resturantModel.responseModel.location
                              .split(',')
                              .last)),
                      infoWindow:
                          InfoWindow(title: 'The title of the marker')));
                  print(
                      'fffffffffffffffff${state.resturantModel.responseModel.assets.length}');

                  return Column(
                    children: [
                      Container(
                        height: 250.h,
                        width: double.infinity,
                        child: Carousel(
                            autoplay: true,
                            dotBgColor: Colors.transparent,
                            dotColor: ColorsUtils.greyTextColor,
                            dotIncreasedColor: ColorsUtils.primaryGreen,
                            dotSize: 8,
                            images: state.resturantModel.responseModel.assets
                                        .length ==
                                    0
                                ? [
                                    Image.asset(
                                      'assets/images/imagenotfound.png',
                                      fit: BoxFit.fill,
                                    ),
                                    Image.asset(
                                      'assets/images/imagenotfound.png',
                                      fit: BoxFit.fill,
                                    ),
                                  ]
                                : List.generate(
                                    state.resturantModel.responseModel.assets
                                        .length,
                                    (i) => Image.network(
                                          state.resturantModel.responseModel
                                              .assets[i].url,
                                          fit: BoxFit.fill,
                                        ))),
                      ),
                      Card(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomListTitle(
                            title:
                                state.resturantModel.responseModel.branchName,
                            trailing: CustomRoundedButton(
                              width: 150.w,
                              backgroundColor: ColorsUtils.primaryGreen,
                              textColor: ColorsUtils.whiteColor,
                              height: 50.h,
                              load: false,
                              text:
                                  state.resturantModel.responseModel.branchName,
                            ),
                          ),
                          CustomListTitle(
                              title: 'workingHours :',
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: List.generate(
                                    state.resturantModel.responseModel
                                        .workingHours.shiftsTiming.length,
                                    (index) => Row(
                                          children: [
                                            CustomText(
                                              text: state
                                                  .resturantModel
                                                  .responseModel
                                                  .workingHours
                                                  .shiftsTiming[index]
                                                  .from,
                                            ),
                                            SizedBox(
                                              width: 15.w,
                                            ),
                                            CustomText(
                                              text: state
                                                  .resturantModel
                                                  .responseModel
                                                  .workingHours
                                                  .shiftsTiming[index]
                                                  .to,
                                            ),
                                          ],
                                        )),
                              )),
                          Container(
                            margin: EdgeInsets.all(10),
                            height: 50.h,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              children: List<Widget>.generate(
                                  state.resturantModel.responseModel.cuisines
                                      .length,
                                  (i) => Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5),
                                        child: CustomRoundedButton(
                                          pressed: null,
                                          width: 100.w,
                                          text: state.resturantModel
                                              .responseModel.cuisines[i].name,
                                          textColor: ColorsUtils.whiteColor,
                                          backgroundColor:
                                              ColorsUtils.primaryGreen,
                                          load: false,
                                        ),
                                      )),
                            ),
                          ),
                          Container(
                            height: 350.h,
                            width: double.infinity,
                            child: GoogleMap(
                              markers: Set<Marker>.of(_markers),
                              myLocationEnabled: true,
                              initialCameraPosition: CameraPosition(
                                target: LatLng(
                                    double.parse(state
                                        .resturantModel.responseModel.location
                                        .split(',')
                                        .first),
                                    double.parse(state
                                        .resturantModel.responseModel.location
                                        .split(',')
                                        .last)),
                                zoom: 14.4746,
                              ),
                              onMapCreated: (GoogleMapController controller) {
                                mapController = controller;
                              },
                            ),
                          ),
                          SizedBox(height: Get.height * 0.05),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: CustomRoundedButton(
                              pressed: () {
                                Get.to(() => BookingNowScreen(
                                      resturantId: state.resturantModel
                                          .responseModel.restaurantId,
                                    ));
                              },
                              height: 50.h,
                              backgroundColor: ColorsUtils.primaryGreen,
                              textColor: ColorsUtils.whiteColor,
                              load: false,
                              text: S.current.booking,
                            ),
                          ),
                        ],
                      ))
                    ],
                  );
                }
                return CircularProgressIndicator(
                    color: ColorsUtils.primaryGreen);
              }),
            ],
          ),
        ),
      ),
    );
  }
}
