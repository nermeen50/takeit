import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:v_room_app/App/app_event.dart';
import 'package:v_room_app/App/app_state.dart';
import 'package:v_room_app/Blocs/home_bloc.dart';
import 'package:v_room_app/generated/l10n.dart';
import 'package:v_room_app/models/response/map_model.dart';
import 'package:v_room_app/screens/details.dart';
import 'package:v_room_app/screens/widgets/custom_text.dart';
import 'package:v_room_app/utils/ColorsUtils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Maps extends StatefulWidget {
  @override
  _MapsState createState() => _MapsState();
}

class _MapsState extends State<Maps> with SingleTickerProviderStateMixin {
  GoogleMapController controller1;

  //static LatLng _center = LatLng(-15.4630239974464, 28.363397732282127);
  static LatLng _initialPosition;
  Set<Marker> _markers = {};
  static LatLng _lastMapPosition = _initialPosition;
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    // _getUserLocation();
    _tabController = TabController(length: 4, vsync: this);
  }

  // void _getUserLocation() async {
  //   Position position = await Geolocator.getCurrentPosition(
  //       desiredAccuracy: LocationAccuracy.high);
  //   setState(() {
  //     _initialPosition = LatLng(position.latitude, position.longitude);
  //   });
  // }

  _onMapCreated(GoogleMapController controller) {
    setState(() {
      controller1 = controller;
    });
  }

  MapType _currentMapType = MapType.normal;

  // void _onMapTypeButtonPressed() {
  //   setState(() {
  //     _currentMapType = _currentMapType == MapType.normal
  //         ? MapType.satellite
  //         : MapType.normal;
  //   });
  // }

  _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }

  // _onAddMarkerButtonPressed() {
  //   setState(() {
  //     _markers.add(Marker(
  //         markerId: MarkerId(_lastMapPosition.toString()),
  //         position: _lastMapPosition,
  //         infoWindow: InfoWindow(
  //             title: "Pizza Parlour",
  //             snippet: "This is a snippet",
  //             onTap: () {}),
  //         onTap: () {},
  //         icon: BitmapDescriptor.defaultMarker));
  //   });
  // }
  PolylinePoints polylinePoints;
  List<LatLng> polylineCoordinates = [];

// Map storing polylines created by connecting two points
  Map<PolylineId, Polyline> polylines = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: BlocBuilder<HomeBloc, AppState>(builder: (_, state) {
          if (state is Loaded) {
            print("kkkkkkkkkkkkkkkk${state}");
            return Column(
              children: [
                Container(
                  height: 300,
                  width: 500,
                  child: GoogleMap(
                    polylines: Set<Polyline>.of(polylines.values),
                    myLocationEnabled: true,
                    onTap: (LatLng location) {
                      print('${location.latitude},${location.longitude}');
                      setState(() {
                        _markers = {};
                        _markers.add(Marker(
                            markerId: MarkerId(location.toString()),
                            position: location,
                            draggable: true,
                            onDrag: (dragEndPosition) {
                              print(dragEndPosition);
                            },
                            onTap: () {},
                            icon: BitmapDescriptor.defaultMarker));
                      });
                      // context
                      //     .read<MapBloc>()
                      //     .updateLatLong('24.728486,46.649050');
                    },
                    markers: _markers,
                    mapType: _currentMapType,
                    initialCameraPosition: CameraPosition(
                      target: _initialPosition,
                      zoom: 14.4746,
                    ),
                    onMapCreated: _onMapCreated,
                    zoomGesturesEnabled: true,
                    onCameraMove: _onCameraMove,
                    compassEnabled: true,
                    myLocationButtonEnabled: false,
                  ),
                ),
                _buildCard(context, state.mapModel),
              ],
            );
          }
          return _initialPosition == null
              ? Container(
                  child: Center(
                    child: Text(
                      'loading map..',
                      style: TextStyle(
                          fontFamily: 'Avenir-Medium', color: Colors.grey[400]),
                    ),
                  ),
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                      Text('dddd'),
                      Container(
                        height: 300,
                        width: 500,
                        child: GoogleMap(
                          polylines: Set<Polyline>.of(polylines.values),
                          myLocationEnabled: true,
                          onTap: (LatLng location) {
                            print('${location.latitude},${location.longitude}');
                            setState(() {
                              _markers = {};
                              _markers.add(Marker(
                                  markerId: MarkerId(location.toString()),
                                  position: location,
                                  draggable: true,
                                  onDrag: (dragEndPosition) {
                                    print(dragEndPosition);
                                  },
                                  onTap: () {},
                                  icon: BitmapDescriptor.defaultMarker));
                            });
                            // context
                            // .read<MapBloc>()
                            // .updateLatLong('24.728486,46.649050');
                          },
                          markers: _markers,
                          mapType: _currentMapType,
                          initialCameraPosition: CameraPosition(
                            target: _initialPosition,
                            zoom: 14.4746,
                          ),
                          onMapCreated: _onMapCreated,
                          zoomGesturesEnabled: true,
                          onCameraMove: _onCameraMove,
                          compassEnabled: true,
                          myLocationButtonEnabled: false,
                        ),
                      ),
                    ]);
        }),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.map),
        onPressed: () {
          context.read<HomeBloc>().add(Click());

          controller1
              .animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
            target: _initialPosition,
            zoom: 14.4746,
          )));
        },
      ),
    );
  }

  Widget _buildCard(BuildContext context, MapListModel model) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: TabBar(
            labelPadding: EdgeInsets.all(10),
            indicator: BoxDecoration(
              color: ColorsUtils.primaryGreen,
              borderRadius: BorderRadius.circular(10),
            ),
            controller: _tabController,
            labelColor: ColorsUtils.whiteColor,
            isScrollable: true,
            indicatorColor: Colors.transparent,
            unselectedLabelColor: ColorsUtils.primaryGreen,
            labelStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
            tabs: [
              CustomText(
                text: S.of(context).all,
              ),
              Row(
                children: [
                  Icon(Icons.food_bank_rounded),
                  CustomText(
                    text: S.of(context).fastFood,
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.food_bank_rounded),
                  CustomText(
                    text: S.of(context).sandwiches,
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.food_bank_rounded),
                  CustomText(
                    text: S.of(context).aribianFood,
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
            width: double.infinity,
            padding: const EdgeInsets.all(8.0),
            height: 500.h,
            child: TabBarView(
              controller: _tabController,
              children: <Widget>[
                ListView.builder(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemCount: model.responseModel.length,
                  itemBuilder: (context, index) {
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
                        if (direction == DismissDirection.startToEnd) {
                          print("Add to favorite");
                        }
                      },
                      child: Container(
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(color: Colors.grey[400]))),
                          child: ListTile(
                            onTap: () {
                              // Get.to(() => Details());
                            },
                            subtitle: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('subtitle'),
                                Row(
                                  children: [
                                    Text(
                                      model.responseModel[index].workingHours
                                          .shiftsTiming[index].from,
                                    ),
                                    Text(model.responseModel[index].workingHours
                                        .shiftsTiming[index].from),
                                  ],
                                ),
                              ],
                            ),
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(model.responseModel[index].name),
                                    Text(model.responseModel[index].restaurantId
                                        .toString()),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(Icons.location_on_outlined),
                                    Text(model.responseModel[index].restaurantId
                                        .toString()),
                                  ],
                                ),
                              ],
                            ),
                            minLeadingWidth: 10.w,
                            leading: Image.asset(
                              S.current.logoImage,
                            ),
                          )),
                    );
                  },
                ),
                Center(
                  child: Text(
                    'Fast food',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                  ),
                ),
                Center(
                  child: Text(
                    'Sandwiches',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                  ),
                ),
                Center(
                  child: Text(
                    'Aribian food',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            )),
      ],
    );
  }
}
