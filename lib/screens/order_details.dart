import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:v_room_app/App/app_event.dart';
import 'package:v_room_app/App/app_state.dart';
import 'package:v_room_app/Blocs/details_order_bloc.dart';
import 'package:v_room_app/Blocs/orders_bloc.dart';
import 'package:v_room_app/screens/widgets/CustomListTitle.dart';
import 'package:v_room_app/screens/widgets/custom_appbar.dart';
import 'package:v_room_app/screens/widgets/custom_rounded_btn.dart';
import 'package:v_room_app/screens/widgets/custom_text.dart';
import 'package:v_room_app/utils/ColorsUtils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderDetails extends StatefulWidget {
  final int orderId;
  OrderDetails({this.orderId});
  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  @override
  void initState() {
    super.initState();
    context.read<OrderDetailsBloc>().add(Details(id: widget.orderId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title: ' تفاصيل الطلب ',
        ),
        body: BlocBuilder<OrderDetailsBloc, AppState>(builder: (_, state) {
          if (state is DetailsOrdersState) {
            var response = state.ordersModel.responseModel;
            return SingleChildScrollView(
              padding: EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomListTitle(
                    leading: CustomText(text: 'date'),
                    trailing: CustomText(text: response.date.toString()),
                  ),
                  CustomListTitle(
                    leading: CustomText(text: 'numberOfGuests'),
                    trailing:
                        CustomText(text: response.numberOfGuests.toString()),
                  ),
                  CustomListTitle(
                    leading: CustomText(text: 'brancName'),
                    trailing: CustomText(text: response.branch.name.toString()),
                  ),
                  CustomListTitle(
                    leading: CustomText(text: 'branchLatLng'),
                    trailing:
                        CustomText(text: response.branch.latLng.toString()),
                  ),
                  CustomListTitle(
                    leading: CustomText(text: 'branchConfig'),
                    trailing:
                        CustomText(text: response.branch.config.toString()),
                  ),
                  CustomListTitle(
                    leading: CustomText(text: 'merchant'),
                    trailing:
                        CustomText(text: response.branch.merchant.toString()),
                  ),
                  CustomListTitle(
                    leading: CustomText(text: 'userLogin'),
                    trailing: CustomText(text: response.user.login.toString()),
                  ),
                  CustomListTitle(
                    leading: CustomText(text: 'activationCode'),
                    trailing: CustomText(
                        text: response.user.activationCode.toString()),
                  ),
                  CustomListTitle(
                    leading: CustomText(text: 'numberOfSeats'),
                    trailing: CustomText(
                        text: response.seatGroup.numberOfSeats.toString()),
                  ),
                  CustomListTitle(
                    leading: CustomText(text: 'count'),
                    trailing:
                        CustomText(text: response.seatGroup.count.toString()),
                  ),
                  CustomListTitle(
                    leading: CustomText(text: 'isOpen'),
                    trailing:
                        CustomText(text: response.seatGroup.isOpen.toString()),
                  ),
                  CustomListTitle(
                    leading: CustomText(text: 'placeSectionName'),
                    trailing: CustomText(
                        text: response.seatGroup.placeSection.name.toString()),
                  ),
                  CustomListTitle(
                    leading: CustomText(text: 'placeSectionBranch'),
                    trailing: CustomText(
                        text:
                            response.seatGroup.placeSection.branch.toString()),
                  ),
                ],
              ),
            );
          }
          return Center(child: CircularProgressIndicator());
        }));
  }
}
