import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:v_room_app/App/app_event.dart';
import 'package:v_room_app/App/app_state.dart';
import 'package:v_room_app/Blocs/orders_bloc.dart';
import 'package:v_room_app/screens/order_details.dart';
import 'package:v_room_app/screens/widgets/CustomListTitle.dart';
import 'package:v_room_app/screens/widgets/custom_appbar.dart';
import 'package:v_room_app/screens/widgets/custom_text.dart';
import 'package:v_room_app/utils/ColorsUtils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Order extends StatefulWidget {
  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<OrdersBloc>().add(Click());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title: 'طلباتي',
        ),
        body: BlocBuilder<OrdersBloc, AppState>(builder: (_, state) {
          if (state is GetAllOrdersState) {
            var response = state.ordersModel.responseModel;

            return ListView.builder(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemCount: response.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () =>
                        Get.to(() => OrderDetails(orderId: response[index].id)),
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.all(7),
                            decoration: BoxDecoration(
                                color: ColorsUtils.primaryYellow,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10))),
                            child: CustomText(
                                text: response[index]
                                    .seatGroup
                                    .isOpen
                                    .toString()),
                          ),
                          Container(
                            decoration:
                                BoxDecoration(color: ColorsUtils.greyTextColor),
                            child: ExpansionTile(
                              tilePadding: EdgeInsets.zero,
                              textColor: Colors.black,
                              trailing: Text(''),
                              subtitle: CustomText(
                                text: response[index].date.toString(),
                                textAlign: TextAlign.end,
                              ),
                              title: Align(
                                  alignment: Alignment.center,
                                  child: CustomText(
                                      text: response[index]
                                          .user
                                          .login
                                          .toString())),
                              children: <Widget>[
                                Container(
                                    width: double.infinity,
                                    color: Colors.white,
                                    child: Column(
                                      children: [
                                        CustomListTitle(
                                          leading: CustomText(text: 'count'),
                                          trailing: CustomText(
                                              text: response[index]
                                                  .seatGroup
                                                  .count
                                                  .toString()),
                                        ),
                                        CustomListTitle(
                                          leading: CustomText(
                                              text: 'numberOfGuests'),
                                          trailing: CustomText(
                                              text: response[index]
                                                  .numberOfGuests
                                                  .toString()),
                                        ),
                                        CustomListTitle(
                                          leading:
                                              CustomText(text: 'numberOfSeats'),
                                          trailing: CustomText(
                                              text: response[index]
                                                  .seatGroup
                                                  .numberOfSeats
                                                  .toString()),
                                        ),
                                        CustomListTitle(
                                          leading: CustomText(
                                              text: 'placeSectionBranch'),
                                          trailing: CustomText(
                                              text: response[index]
                                                  .seatGroup
                                                  .placeSection
                                                  .branch
                                                  .toString()),
                                        ),
                                        CustomListTitle(
                                          leading: CustomText(
                                              text: 'placeSectionname'),
                                          trailing: CustomText(
                                              text: response[index]
                                                  .seatGroup
                                                  .placeSection
                                                  .name
                                                  .toString()),
                                        ),
                                      ],
                                    )),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          CustomText(
                                            text: 'سعر الطلب : 88.00 ريال',
                                            fontSize: 10,
                                          ),
                                          CustomText(
                                            text: 'الطلب : 587455566',
                                            fontSize: 11,
                                            textColor: ColorsUtils.primaryGreen,
                                          ),
                                        ],
                                      ),
                                      CustomText(
                                        text: 'التوصيل : 9.00 ريال',
                                        fontSize: 11,
                                      ),
                                      CustomText(
                                        text: 'المجموع:59.00 ريال',
                                        fontWeight: FontWeight.bold,
                                        textColor: ColorsUtils.primaryGreen,
                                        fontSize: 15,
                                      ),
                                      CustomText(
                                        text: 'شامل ضريبه 15% - 12.00 ريال',
                                        fontSize: 11,
                                      ),
                                      CustomText(
                                        text:
                                            'جميع الاسعار شامله ضريبه القيمه المضافه - الرقم الضريبي 5587758888',
                                        fontSize: 11,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                });
          }
          return Center(child: CircularProgressIndicator());
        }));
  }
}
